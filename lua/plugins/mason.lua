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

  -- Mason LSPconfig integration with handlers and ensured servers
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
      { "williamboman/mason.nvim" },
      "neovim/nvim-lspconfig",
    },
    opts = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local navic = require("nvim-navic")
      local lspconfig = require("lspconfig")

      local on_attach = function(client, bufnr)
        if client.supports_method("textDocument/documentSymbol") then
          navic.attach(client, bufnr)
        end

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
          })
        end,

        ["tailwindcss"] = function()
          lspconfig.tailwindcss.setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = {
              tailwindCSS = {
                experimental = {
                  classRegex = {
                    { "class\\s*=\\s*\"([^\"]*)\"", 1 },
                    { "className\\s*=\\s*\"([^\"]*)\"", 1 },
                    { "tw\\`([^`]*)\\`", 1 },
                    { "cn\\(([^)]*)\\)", 1 },
                  },
                },
              },
            },
            filetypes = {
              "html", "javascript", "typescript", "javascriptreact",
              "typescriptreact", "svelte", "vue", "php", "blade"
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
            settings = {
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
      }

      return {
        ensure_installed = {
          "lua_ls", "emmet_language_server", "clangd", "bashls", "cssls",
          "html", "vtsls", "jsonls", "marksman", "pyright", "pylsp",
          "sqlls", "vimls", "grammarly",
        },
        handlers = handlers,
      }
    end,
  },
}

