return {
    -- THEMES
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "storm", -- options: "storm", "night", "moon", "day"
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
                sidebars = { "qf", "help" },
                float_background = "dark",
                lualine_bold = true,
            })
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                integrations = {
                    cmp = true,
                    gitsigns = true,
                    nvimtree = true,
                    treesitter = true,
                    telescope = true,
                    mason = true,
                },
            })
        end,
    },

    -- MASON
    {
        "williamboman/mason.nvim",
        cmd = "Mason",
        opts = {
            ui = {
                border = "rounded",
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },

    -- MASON LSPCONFIG
    {
        "williamboman/mason-lspconfig.nvim",
        lazy = false,
        dependencies = {
            { "williamboman/mason.nvim" },
            "neovim/nvim-lspconfig",
        },
        opts = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

            vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
            vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
            vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Info" })
            vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
            vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
            vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, { desc = "Diagnostic Info" })

            return {
                ensure_installed = {
                    "lua_ls", "emmet_language_server", "clangd", "bashls", "cssls",
                    "html", "vtsls", "jsonls", "marksman", "pyright", "pylsp",
                    "sqlls", "vimls", "grammarly",
                },
                handlers = {
                    function(server_name)
                        lspconfig[server_name].setup({ capabilities = capabilities })
                    end,
                    ["tailwindcss"] = function()
                        lspconfig.tailwindcss.setup({
                            capabilities = capabilities,
                            settings = {
                                tailwindCSS = {
                                    experimental = {
                                        classRegex = {
                                            { "class\\s*=\\s*\"([^\"]*)\"", 1 },
                                            { "className\\s*=\\s*\"([^\"]*)\"", 1 },
                                            { "tw\\`([^`]*)\\`", 1 },
                                            { "cn\\(([^)]*)\\)", 1 },
                                        },
                                    },
                                },
                            },
                            filetypes = {
                                "html", "javascript", "typescript", "javascriptreact",
                                "typescriptreact", "svelte", "vue", "php", "blade"
                            },
                            root_dir = lspconfig.util.root_pattern(
                                "tailwind.config.js", "tailwind.config.ts", "postcss.config.js",
                                "package.json", ".git"
                            ),
                        })
                    end,
                    ["lua_ls"] = function()
                        lspconfig.lua_ls.setup({
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                },
                            },
                        })
                    end,
                },
            }
        end,
    },

    -- GLOBAL LSP DIAGNOSTICS SETUP
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            vim.opt.signcolumn = "yes"
            vim.diagnostic.config({
                virtual_text = true,
                signs = true,
                underline = true,
                update_in_insert = true,
                severity_sort = true,
                float = {
                    border = "rounded",
                    source = "always",
                },
            })
        end,
    },

    -- AUTOCOMPLETE (nvim-cmp)
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                completion = {
                    completeopt = "menu,menuone,noselect",
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-Space>"] = cmp.mapping.complete(),
                    ["<CR>"] = cmp.mapping.confirm({ select = true }),
                    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                    { name = "path" },
                    { name = "buffer" },
                }),
            })
        end,
    },
}

