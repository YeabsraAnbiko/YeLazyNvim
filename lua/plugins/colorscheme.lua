return {
  {
    "folke/tokyonight.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    lazy = false,
    priority = 1000,
    opts = {
      float_border = true,
      dim_inactive = true,
      lualine_bold = true,
    },
    on_highlights = function(hl, c)
      hl.FloatBorder = { fg = c.blue, bg = c.bg_dark }
      hl.NormalFloat = { fg = c.fg_float, bg = c.bg_float }

      hl.DiagnosticFloatBorder = { fg = c.orange, bg = c.bg_dark }

      hl.VertSplit = { fg = c.blue, bg = c.bg_dark }
      hl.WinSeparator = { fg = c.blue, bg = c.bg_dark }

      hl.NeoTreeWinSeparator = { fg = c.blue, bg = c.bg_dark }
    end,
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
