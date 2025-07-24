return {
  -- Mason core
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- Mason LSPconfig integration
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      { "williamboman/mason.nvim" },
      "neovim/nvim-lspconfig",
    },
    opts = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true

      local navic = require("nvim-navic")
      local lspconfig = require("lspconfig")

      local on_attach = function(client, bufnr)
        if client.supports_method("textDocument/documentSymbol") then
          navic.attach(client, bufnr)
        end

        -- Document Highlighting
        if client.server_capabilities.documentHighlightProvider then
          vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
          vim.api.nvim_create_autocmd("CursorHold", {
            group = "lsp_document_highlight",
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
          })
          vim.api.nvim_create_autocmd("CursorMoved", {
            group = "lsp_document_highlight",
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
          })
        end

        -- Format on save
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ async = false })
            end,
          })
        end
      end

      local handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            flags = {
              debounce_text_changes = 150,
            },
          })
        end,

        ["tailwindcss"] = function()
          lspconfig.tailwindcss.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            flags = { debounce_text_changes = 150 },
            settings = {
              tailwindCSS = {
                experimental = {
                  classRegex = {
                    { "class\\s*=\\s*\"([^\"]*)\"",     1 },
                    { "className\\s*=\\s*\"([^\"]*)\"", 1 },
                    { "tw\\`([^`]*)\\`",                1 },
                    { "cn\\(([^)]*)\\)",                1 },
                  },
                },
              },
            },
            filetypes = {
              "html", "javascript", "typescript", "javascriptreact",
              "typescriptreact", "svelte", "vue", "php", "blade",
            },
            root_dir = lspconfig.util.root_pattern(
              "tailwind.config.js", "tailwind.config.ts", "postcss.config.js",
              "package.json", ".git"
            ),
          })
        end,

        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            flags = { debounce_text_changes = 150 },
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
                workspace = {
                  library = vim.api.nvim_get_runtime_file("", true),
                  checkThirdParty = false,
                },
                telemetry = { enable = false },
              },
            },
          })
        end,
        ["emmet_ls"] = function()
          require("lspconfig").emmet_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = {
              "html", "css", "scss", "javascriptreact", "typescriptreact", "vue", "svelte", "xml"
            },
            init_options = {
              html = {
                options = {
                  ["bem.enabled"] = true,
                },
              },
            },
          })
        end,
      }

      return {
        ensure_installed = {
          "lua_ls", "clangd", "bashls", "cssls", "tailwindcss",
          "html", "ts_ls", "jsonls", "marksman", "pyright",
          "sqlls", "vimls", "emmet_ls",
        },
        handlers = handlers,
      }
    end,
  },
}
