return {
  {
    "folke/tokyonight.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      transparent = false,
      terminal_colors = true,
      styles = {
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        sidebars = "dark",
        floats = "dark",
      },
      sidebars = { "qf", "help", "vista_kind", "terminal", "packer" },
      float_border = true,
      dim_inactive = true,
      lualine_bold = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme("tokyonight")

      -- Customize split characters
      vim.opt.fillchars = {
        vert = "│", -- vertical split
        horiz = "─", -- horizontal split
        horizup = "┴",
        horizdown = "┬",
        vertleft = "┤",
        vertright = "├",
        verthoriz = "┼",
      }

      vim.cmd(" highlight WinSeparator guibg=NONE guifg=#7aa2f7 ")

      -- Enable separate highlight for inactive windows (optional)
      vim.opt.winhighlight = "WinSeparator:WinSeparator"
    end,
  },
}
