return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          javascript = { "prettierd" },
          typescript = { "prettierd" },
          javascriptreact = { "prettierd" },
          typescriptreact = { "prettierd" },
          lua = { "stylua" },
          json = { "prettierd" },
          html = { "prettierd" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
        },
      })
    end,
  },
}
