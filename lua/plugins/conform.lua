return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },

    keys = {
      {
        "<leader>fd",
        function()
          require("conform").format({
            lsp_fallback = true,
            async = false,
          })
        end,
        mode = { "n", "v" },
        desc = "Format document (Conform + LSP fallback)",
      },
    },

    config = function()
      local conform = require("conform")

      conform.setup({
        formatters = {
          google_java_format = {
            command = "google-java-format",
            args = { "--aosp", "-" },
            stdin = true,
          },
        },

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
      })
    end,
  },
}
