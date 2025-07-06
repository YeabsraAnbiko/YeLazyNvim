return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000, -- load early
    enabled = true,
    lazy = false,
    config = function()
      require("rose-pine").setup({
        variant = "main", -- options: "main" (default), "moon", "dawn"
        dark_variant = "moon",
        dim_inactive_windows = true,
        extend_background_behind_borders = true,

        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },

        highlight_groups = {
          -- Customize UI elements
          VertSplit = { fg = "highlight_high", bg = "none" },
          WinSeparator = { fg = "highlight_high", bg = "none" },
          CursorLine = { bg = "surface" },
        },
      })

      vim.cmd.colorscheme("rose-pine")
    end,
  },
}

