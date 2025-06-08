-- lua/plugins/colorscheme.lua
return {
  -- Tokyonight (Default Theme)
  {
    "folke/tokyonight.nvim",
    priority = 1000, -- Load first
    config = function()
      require("tokyonight").setup({
        style = "moon", -- "storm", "moon", "night", or "day"
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
        sidebars = { "qf", "help", "neo-tree", "terminal", "spectre_panel" },
        dim_inactive = false,
        lualine_bold = true,
      })

      -- Set as default theme
      vim.cmd.colorscheme("tokyonight")


    end,
  },

  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 999,
    opts = {
      flavour = "mocha", -- options: latte, frappe, macchiato, mocha
      transparent_background = false,
      term_colors = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        telescope = true,
        notify = true,
        mini = true,
        which_key = true,
        treesitter = true,
        native_lsp = {
          enabled = true,
          underlines = {
            errors = { "undercurl" },
            hints = { "undercurl" },
            warnings = { "undercurl" },
            information = { "undercurl" },
          },
        },
      },
    },
  },
}

