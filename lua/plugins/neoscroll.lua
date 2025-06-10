return {
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      require("neoscroll").setup({
        hide_cursor = true,
        stop_eof = true,
        respect_scrolloff = false,
      })

      local t = {}
      t["<C-u>"] = { "scroll", { "-vim.wo.scroll", "true", "250" } }
      t["<C-d>"] = { "scroll", { "vim.wo.scroll", "true", "250" } }
      t["<C-b>"] = { "scroll", { "-vim.api.nvim_win_get_height(0)", "true", "450" } }
      t["<C-f>"] = { "scroll", { "vim.api.nvim_win_get_height(0)", "true", "450" } }
      require("neoscroll.config").set_mappings(t)
    end,
  },
}
