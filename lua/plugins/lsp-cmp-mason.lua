return {
    {
        "mason-org/mason.nvim",
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

    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            "neovim/nvim-lspconfig",
        },

        opts = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()
            local lspconfig = require("lspconfig")

                vim.keymap.set("n", "gd",vim.lsp.buf.definition, { desc = "Jump to definition" })
                vim.keymap.set("n", "gd",vim.lsp.buf.declaration, { desc = "Jump to declaration" })
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {desc = "Rename"})
                vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "Code action"})
                vim.keymap.set("n", "<c-k>", vim.lsp.buf.signature_help, {desc = "Show signature help"})
                vim.keymap.set("n", "K", vim.lsp.buf.hover, {desc = "Show hover info"})
                vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, {desc = "Go to next diagnostics"})
                vim.keymap.set("n", "]d", vim.diagnostic.goto_next, {desc = "Go to previous diagnostics"})
                vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, {desc = "Show diagnostic info"})

            return {
                ensure_installed = {
                    "lua_ls", "emmet_language_server", "clangd", "bashls", "cssls",
                    "html", "vtsls", "jsonls", "marksman", "pyright", "pylsp",
                    "sqlls", "vimls", "grammarly",
                },

                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                    ["tailwindcss"] = function()
                        lspconfig.tailwindcss.setup {
                            capabilities = capabilities,
                            settings = {
                                tailwindCSS = {
                                    experimental = {
                                        classRegex = {
                                            { "class\\s*=\\s*\"([^\"]*)\"", 1 },
                                            { "className\\s*=\\s*\"([^\"]*)\"", 1 },
                                            { "tw\\`([^`]*)\\`", 1 },  -- Tailwind macro
                                            { "cn\\(([^)]*)\\)", 1 }, -- clsx/cn function
                                        },
                                    },
                                },
                            },
                            filetypes = {
                                "html", "javascript", "typescript", "javascriptreact",
                                "typescriptreact", "svelte", "vue", "php", "blade"
                            },
                            root_dir = lspconfig.util.root_pattern("tailwind.config.js", "tailwind.config.ts", "postcss.config.js", "package.json", ".git"),
                        }
                    end,
                    lua_ls = function()
                        require("lspconfig").lua_ls.setup({
                            settings = {
                                Lua = {
                                    diagnostics = {
                                        globals = { "vim" },
                                    },
                                },
                            },
                            capabilities = capabilities,
                        })
                    end
                },
            }
        end,
    },

    -- -- lspconfig: just for global diagnostic settings
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
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

    -- -- nvim-cmp (autocomplete)
    {
        "hrsh7th/nvim-cmp",
        event = "insertenter",
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
                sources = {
                    { name = "nvim_lsp" },
                    { name = "path" },
                    { name = "buffer" },
                    { name = "luasnip" },
                },

                mapping = cmp.mapping.preset.insert({
                    ["<c-space>"] = cmp.mapping.complete(),
                    ["<cr>"] = cmp.mapping.confirm({ select = true }),
                    ["<tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ["<s-tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                }),
                completion = {
                    completeopt = "menu,menuone,noselect",
                },
            })
        end,
    },
}

