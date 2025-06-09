-- lua/plugins/colorscheme.lua
return {
    -- Tokyonight (Default Theme)
    {
        "folke/tokyonight.nvim",
        priority = 999, -- Load first
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
            -- vim.cmd.colorscheme("tokyonight-moon")


        end,
    },

    -- Catppuccin
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 998,
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
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000, -- load early
        lazy = false,
        config = function()
            require("rose-pine").setup({
                variant = "moon", -- options: "main" (default), "moon", "dawn"
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

