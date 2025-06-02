return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
	    require('rose-pine').setup({
		    --- @usage 'auto'|'main'|'moon'|'dawn'
		    variant = 'auto',
		    --- @usage 'main'|'moon'|'dawn'
		    dark_variant = 'moon',
		    bold_vert_split = false,
		    dim_nc_background = false,
		    disable_background = false,
		    disable_float_background = true,
		    disable_italics = false,

		    --- @usage string hex value or named color from rosepinetheme.com/palette
		    groups = {
			    background = 'base',
			    background_nc = '_experimental_nc',
			    panel = 'surface',
			    panel_nc = 'base',
			    border = 'highlight_med',
			    comment = 'muted',
			    link = 'iris',
			    punctuation = 'subtle',

			    error = 'love',
			    hint = 'iris',
			    info = 'foam',
			    warn = 'gold',

			    headings = {
				    h1 = 'iris',
				    h2 = 'foam',
				    h3 = 'rose',
				    h4 = 'gold',
				    h5 = 'pine',
				    h6 = 'foam',
			    }
			    -- or set all headings at once
			    -- headings = 'subtle'
		    },

		    -- Change specific vim highlight groups
		    -- https://github.com/rose-pine/neovim/wiki/Recipes
		    highlight_groups = {
			    ColorColumn = { bg = 'highlight_med' },
			    StatusLine = { fg = 'love', bg = 'love', blend = 10 },
			    StatusLineNC = { fg = "subtle", bg = "surface" },
			    -- Blend colours against the "base" background
			    CursorLine = { bg = 'foam', blend = 10 },
			    TelescopeBorder = { fg = "foam", bg = "none" },
			    TelescopeNormal = { bg = "none" },
			    TelescopePromptNormal = { bg = "base" },
			    TelescopeResultsNormal = { fg = "subtle", bg = "none" },
			    TelescopeSelection = { fg = "text", bg = "base" },
			    TelescopeSelectionCaret = { fg = "rose", bg = "rose" },

			    CurSearch = { fg = "base", bg = "leaf", inherit = false },
			    Search = { fg = "text", bg = "leaf", blend = 20, inherit = false },

		    }
	    })

	    -- Set colorscheme after options
	    vim.cmd [[
	    colorscheme rose-pine
	    highlight SignColumn guibg=NONE
	    highlight Normal guibg=NONE ctermbg=NONE
	    highlight NormalNC guibg=NONE ctermbg=NONE
	    highlight EndOfBuffer guibg=NONE ctermbg=NONE
	    highlight LineNr guibg=NONE
	    ]]

    end
  },
  {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    priority = 1000,
    config = function()
-- Default options:
require("gruvbox").setup({
  terminal_colors = true, -- add neovim terminal colors
  undercurl = true,
  underline = true,
  bold = true,
  italic = {
    strings = true,
    emphasis = true,
    comments = true,
    operators = false,
    folds = true,
  },
  strikethrough = true,
  invert_selection = false,
  invert_signs = false,
  invert_tabline = false,
  inverse = true, -- invert background for search, diffs, statuslines and errors
  contrast = "", -- can be "hard", "soft" or empty string
  palette_overrides = {},
  overrides = {},
  dim_inactive = false,
  transparent_mode = true,
})
    end
  }
}

