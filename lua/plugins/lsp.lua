return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    keys = {
      { "<leader>lD", vim.diagnostic.setloclist,  desc = "Set Diagnostics to Location List" },
      { "<leader>lq", vim.diagnostic.setqflist,   desc = "Set Diagnostics to Quickfix List" },
      { "<leader>ln", vim.diagnostic.goto_next,   desc = "Go to Next Diagnostic" },
      { "<leader>lp", vim.diagnostic.goto_prev,   desc = "Go to Previous Diagnostic" },
      { "gd",         vim.lsp.buf.definition,     desc = "Go to Definition" },
      { "gD",         vim.lsp.buf.declaration,    desc = "Go to Declaration" },
      { "<leader>rn", vim.lsp.buf.rename,         desc = "Rename" },
      { "<leader>ca", vim.lsp.buf.code_action,    desc = "Code Action" },
      { "<C-k>",      vim.lsp.buf.signature_help, desc = "Signature Help" },
      { "K",          vim.lsp.buf.hover,          desc = "Hover Info" },
      { "<leader>dI", vim.diagnostic.open_float,  desc = "Open Diagnostic Float" },
      { "<leader>fd", vim.lsp.buf.format,         desc = "Format Document" },
      {
        "<leader>vt",
        function()
          -- Store the state globally or in a module-level variable
          -- Avoid local scope so it persists across reloads
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
          source = "always",
        },
      })
    end,
  },
}
