return {
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      local neoscroll = require("neoscroll")
      neoscroll.setup({
        stop_eof = true,
        respect_scrolloff = false,
      })
    end,
  },
}
