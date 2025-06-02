return {
    {
        'nvim-telescope/telescope.nvim',
        config = function()
            local actions = require('telescope.actions')

            require('telescope').setup({
                defaults = {
                    mappings = {
                        i = {  -- Insert mode
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-k>"] = actions.move_selection_previous,
                        }
                    },
                },
            })

            local builtin = require('telescope.builtin')

            -- File Search

            vim.keymap.set('n', '<leader>ff', function()
                builtin.find_files({hidden=true})
            end)

            vim.keymap.set('n', '<leader>fh', function ()
                builtin.oldfiles()
            end)

            vim.keymap.set('n', '<leader>fb', function ()
                builtin.buffers()
            end)

            vim.keymap.set('n', '<leader>fg', function()
                builtin.live_grep()
            end)

            vim.keymap.set('n', '<leader>ll', function()
                builtin.current_buffer_fuzzy_find()
            end)

            -- Telescope Git commands

            vim.keymap.set('n', '<leader>Gf', function()
                builtin.git_files()
            end)

            vim.keymap.set('n', '<leader>Gl', function ()
                builtin.git_commits()
            end)

            vim.keymap.set('n', '<leader>Gd', function ()
                builtin.git_bcommits()
            end)

            vim.keymap.set('n', '<leader>Gs', function ()
                builtin.git_status()
            end)

            vim.keymap.set('n', '<leader>Gb', function ()
                builtin.git_branches()
            end)

            -- Others

            vim.keymap.set('n', '<leader>cs', function()
                builtin.colorscheme()
            end)

            vim.keymap.set('n', '<leader>rg', function ()
                builtin.registers()
            end)

            vim.keymap.set('n', '<leader>tr', function()
                builtin.treesitter()
            end)

            vim.keymap.set('n', '<leader>sp', function ()
                builtin.spell_suggest()
            end)

            vim.keymap.set('n', '<leader>vo', function ()
                builtin.vim_options()
            end)

            vim.keymap.set('n', '<leader>cm', function ()
                builtin.commands()
            end)


        end
    }
}

