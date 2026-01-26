return {
  -- Mason core
  {
    "mason-org/mason.nvim",
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
    config = function()
      require("mason").setup({
        log_level = vim.log.levels.DEBUG,
      })
    end,
  },

  -- Mason LSPconfig integration
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      { "mason-org/mason.nvim" },
      "neovim/nvim-lspconfig",
    },
    opts = {
      automatic_enable = {
        exclude = { "jdtls" },
      }
    },
    config = function()
      require("mason-lspconfig").setup()
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
                    { 'class\\s*=\\s*"([^"]*)"', 1 },
                    { 'className\\s*=\\s*"([^"]*)"', 1 },
                    { "tw\\`([^`]*)\\`", 1 },
                    { "cn\\(([^)]*)\\)", 1 },
                  },
                },
              },
            },
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
            root_dir = lspconfig.util.root_pattern(
              "tailwind.config.js",
              "tailwind.config.ts",
              "postcss.config.js",
              "package.json",
              ".git"
            ),
          })
        end,

        ["emmet_ls"] = function()
          require("lspconfig").emmet_ls.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            filetypes = {
              "html",
              "css",
              "scss",
              "javascriptreact",
              "typescriptreact",
              "vue",
              "svelte",
              "xml",
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

      vim.lsp.config.clangd = {
        cmd = { "clangd" },
        filetypes = { "c", "cpp", "objc", "objcpp" },
        root_dir = vim.fs.root(0, { "compile_commands.json", ".git" }),
        capabilities = capabilities,
        on_attach = on_attach,
      }

      -- Start LSP automatically
      vim.lsp.enable({ "pyright", "marksman", "clangd" })

      return {
        ensure_installed = {
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
        },
        handlers = handlers,
      }
    end,
  },
}
