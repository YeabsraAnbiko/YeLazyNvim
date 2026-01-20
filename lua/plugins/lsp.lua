return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    keys = {
      { "<leader>lD", vim.diagnostic.setloclist, desc = "Set Diagnostics to Location List" },
      { "<leader>lq", vim.diagnostic.setqflist, desc = "Set Diagnostics to Quickfix List" },
      -- nvim lsp mapings
      { "gd", vim.lsp.buf.definition, desc = "Go to Definition" },
      { "gD", vim.lsp.buf.declaration, desc = "Go to Declaration" },
    },

    config = function()
      vim.diagnostic.config({
        virtual_lines = true,
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
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    keys = {
      {
        "<leader>vt",
        function()
          local config = vim.diagnostic.config() or {}
          if config.virtual_text then
            vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
          elseif config.virtual_lines then
            vim.diagnostic.config({ virtual_text = true, virtual_lines = false })
          end
        end,
        desc = "Toggle lsp_lines",
      },
      {
        "<leader>vT",
        function()
          local cfg = vim.diagnostic.config() or {}

          local diagnostics_enabled = cfg.virtual_text or cfg.virtual_lines

          if diagnostics_enabled then
            vim.diagnostic.config({
              virtual_text = false,
              virtual_lines = false,
            })
          else
            vim.diagnostic.config({
              virtual_text = true,
              virtual_lines = false,
            })
          end
        end,
        desc = "Toggle all diagnostics (virtual_text + lsp_lines)",
      },
    },
    config = function()
      require("lsp_lines").setup()
      vim.diagnostic.config({ virtual_text = false, virtual_lines = true })
    end,
  },
}
