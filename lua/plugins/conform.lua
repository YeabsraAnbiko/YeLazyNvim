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
          java = { "google_java_format" },
          sql = { "sql_formatter" },
        },
        format_on_save = {
          lsp_fallback = true,
          async = false,
        },
      })
    end,
  },
}
