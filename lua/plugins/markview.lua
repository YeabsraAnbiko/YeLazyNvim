return {
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    keys = {
      { "<leader>mp", "<cmd>Markview toggle<cr>", desc = "Toggle Markview Preview" },
      { "<leader>ms", "<cmd>Markview splitToggle<cr>", desc = "Toggle Markview Split Preview" },
    },
    config = function()
      local markview = require("markview")

      markview.setup({
        preview = {
          auto_enable = false,
          icon_provider = "internal",
        },
      })
    end,
  },
}
