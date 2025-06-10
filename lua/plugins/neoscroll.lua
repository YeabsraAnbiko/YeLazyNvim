return {
  {
    "karb94/neoscroll.nvim",
    event = "WinScrolled",
    config = function()
      local neoscroll = require("neoscroll")
      neoscroll.setup({
        -- You can customize easing functions, mappings, etc.
        -- For example:
        -- hide_cursor = true,
        -- stop_eof = true,
        -- respect_scrolloff = false,
      })

      -- Manually map keys using neoscroll.scroll()
      vim.keymap.set("n", "<C-u>", function()
        neoscroll.scroll(-vim.wo.scroll, true, 250)
      end, { silent = true })

      vim.keymap.set("n", "<C-d>", function()
        neoscroll.scroll(vim.wo.scroll, true, 250)
      end, { silent = true })

      vim.keymap.set("n", "<C-b>", function()
        neoscroll.scroll(-vim.api.nvim_win_get_height(0), true, 450)
      end, { silent = true })

      vim.keymap.set("n", "<C-f>", function()
        neoscroll.scroll(vim.api.nvim_win_get_height(0), true, 450)
      end, { silent = true })
    end,
  },
}

