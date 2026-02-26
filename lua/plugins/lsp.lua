return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    keys = {
      { "<leader>lD", vim.diagnostic.setloclist, desc = "Set Diagnostics to Location List" },
      { "<leader>lq", vim.diagnostic.setqflist, desc = "Set Diagnostics to Quickfix List" },
      -- nvim lsp mapings
      { "gd", vim.lsp.buf.definition, desc = "Go to Definition" },
      { "gD", vim.lsp.buf.declaration, desc = "Go to Declaration" },

      {
        "<leader>vt",
        function()
          local current = vim.diagnostic.config().virtual_text
          vim.diagnostic.config({
            virtual_text = not current,
          })

          if current then
            vim.notify("Virtual text disabled")
          else
            vim.notify("Virtual text enabled")
          end
        end,
        desc = "Toggle diagnostic virtual text",
      },
    },

    config = function()
      vim.diagnostic.config({
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true,
        float = {
          source = true,
        },
      })
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      "mason-org/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local navic = require("nvim-navic")
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(client, bufnr)
        if client.supports_method("textDocument/documentSymbol") then
          navic.attach(client, bufnr)
        end

        if client.supports_method("textDocument/documentHighlight") then
          local group = vim.api.nvim_create_augroup("lsp_document_highlight_" .. bufnr, { clear = true })

          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            group = group,
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            group = group,
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
          })
        end
      end

      local servers = {
        "lua_ls",
        "clangd",
        "bashls",
        "cssls",
        "tailwindcss",
        "html",
        "ts_ls",
        "jsonls",
        "marksman",
        "pyright",
        "sqlls",
        "vimls",
        "emmet_ls",
        "eslint",
      }

      require("mason-lspconfig").setup({
        ensure_installed = servers,
        automatic_enable = {
          exclude = {
            "jdsls",
          },
        },
      })

      for _, server in ipairs(servers) do
        if server == "lua_ls" then
          vim.lsp.config("lua_ls", {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = { debounce_text_changes = 150 },
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                workspace = { library = vim.api.nvim_get_runtime_file("", true), checkThirdParty = false },
                telemetry = { enable = false },
              },
            },
          })
          vim.lsp.enable("lua_ls")
        elseif server == "tailwindcss" then
          vim.lsp.config("tailwindcss", {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = { debounce_text_changes = 150 },
            filetypes = {
              "html",
              "javascript",
              "typescript",
              "javascriptreact",
              "typescriptreact",
              "svelte",
              "vue",
              "php",
              "blade",
            },
            root_dir = require("lspconfig.util").root_pattern(
              "tailwind.config.js",
              "tailwind.config.ts",
              "postcss.config.js",
              "package.json",
              ".git"
            ),
            settings = {
              tailwindCSS = {
                experimental = {
                  classRegex = {
                    { 'class\\s*=\\s*"([^"]*)"', 1 },
                    { 'className\\s*=\\s*"([^"]*)"', 1 },
                    { "tw\\`([^`]*)\\`", 1 },
                    { "cn\\(([^)]*)\\)", 1 },
                  },
                },
              },
            },
          })
          vim.lsp.enable("tailwindcss")
        elseif server == "emmet_ls" then
          vim.lsp.config("emmet_ls", {
            on_attach = on_attach,
            capabilities = capabilities,
            filetypes = { "html", "css", "scss", "javascriptreact", "typescriptreact", "vue", "svelte", "xml" },
            init_options = { html = { options = { ["bem.enabled"] = true } } },
          })
          vim.lsp.enable("emmet_ls")
        else
          vim.lsp.config(server, {
            on_attach = on_attach,
            capabilities = capabilities,
            flags = { debounce_text_changes = 150 },
          })
          vim.lsp.enable(server)
        end
      end
    end,
  },
}
