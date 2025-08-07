return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    keys = {
      { "<leader>lD", vim.diagnostic.setloclist, desc = "Set Diagnostics to Location List" },
      { "<leader>lq", vim.diagnostic.setqflist,  desc = "Set Diagnostics to Quickfix List" },
      -- nvim lsp mapings
      { "gd",         vim.lsp.buf.definition,    desc = "Go to Definition" },
      { "gD",         vim.lsp.buf.declaration,   desc = "Go to Declaration" },
      { "<leader>fd", vim.lsp.buf.format,        desc = "Format Document (Visual)" },
      {
        "<leader>vt",
        function()
          if vim.g.virtual_text_enabled == nil then
            vim.g.virtual_text_enabled = true
          end

          vim.g.virtual_text_enabled = not vim.g.virtual_text_enabled

          vim.diagnostic.config({
            virtual_text = vim.g.virtual_text_enabled
          })

          print("Diagnostics virtual text " .. (vim.g.virtual_text_enabled and "enabled" or "disabled"))
        end,
        desc = "Toggle Diagnostics Virtual Text"
      },
    },

    config = function()
      vim.opt.signcolumn = "yes"
      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true,
        float = {
          border = "rounded",
          source = true,
        },
      })
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then
            return
          end

          if client and client.server_capabilities.documentFormattingProvider then
            vim.api.nvim_create_autocmd("BufWritePre", {
              buffer = args.buf,
              callback = function()
                vim.lsp.buf.format({ bufnr = args.buf, client_id = client.id })
              end,
            })
          end
        end,
      })
    end,
  },
}
