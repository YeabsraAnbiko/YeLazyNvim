return{
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        opts = {
            lsp = {
                progress = {
                    enabled = true, -- Enables LSP progress messages
                },
                signature = {
                    enabled = true, -- Show function signature help
                },
                hover = {
                    enabled = true, -- Enable hover doc popups
                },
                message = {
                    enabled = true, -- Show LSP messages in Noice UI
                },
            },

            -- Enables command line UI replacement
            cmdline = {
                enabled = true,
                view = "cmdline_popup", -- or "cmdline"
                format = {
                    cmdline = { icon = "", title = "" },
                    search_down = { icon = " ", title = "" },
                    search_up = { icon = " ", title = "" },
                    filter = { icon = "$", title = "" },
                    lua = { icon = "", title = "" },
                    help = { icon = "", title = "" },
                },
            },

            -- Command line popup styling
            views = {
                cmdline_popup = {
                    position = {
                        row = "90%",
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = "auto",
                    },
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                    },
                },
                popupmenu = {
                    relative = "editor",
                    position = {
                        row = 8,
                        col = "50%",
                    },
                    size = {
                        width = 60,
                        height = 10,
                    },
                    border = {
                        style = "rounded",
                        padding = { 0, 1 },
                    },
                    win_options = {
                        winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                    },
                },
            },

            -- Popup menu (used for cmdline completion, etc.)
            popupmenu = {
                enabled = true,
                backend = "nui", -- requires nui.nvim
            },

            -- Message history (e.g., :messages)
            messages = {
                enabled = true,
                view = "notify", -- or "mini", "split", etc.
                view_error = "notify",
                view_warn = "notify",
                view_history = "messages",
                view_search = "virtualtext",
            },

            -- Notifications
            notify = {
                enabled = true,
                view = "notify",
            },

            -- Presets for common UI layouts and styles
            presets = {
                bottom_search = true,         -- classic bottom cmdline for `/` and `?`
                command_palette = true,       -- position cmdline and popupmenu together
                long_message_to_split = true, -- long messages go to split
                inc_rename = false,           -- enable input dialog for :IncRename
                lsp_doc_border = true,        -- add border to LSP hover/signature
            },

            throttle = 1000, -- Throttle UI updates (ms)
            smart_move = {
                enabled = true, -- Smart window management
                excluded_filetypes = { "cmp_menu", "cmp_docs", "" },
            },

            routes = {}, -- custom message filtering can be added here
        },
    },
}
