return {
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup()
        end
    },
    { 
        'nvim-lualine/lualine.nvim',
        dependencies = { 
            'nvim-tree/nvim-web-devicons', opt = true,
        },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'powerline_dark',
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                    always_divide_middle = true,
                    always_show_tabline = false,
                    globalstatus = true,
                    refresh = {
                        statusline = 100,
                        tabline = 100,
                        winbar = 100,
                    }
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {},
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {'filename'},
                    lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },

                tabline = {
                    lualine_a = {},
                    lualine_b = {
                        { 'windows',
                        show_filename_only = true,
                        mode = 2,
                        max_length = vim.o.columns * 2 / 3,
                        filetype_names = { TelescopePrompt = 'Telescope' } }
                    },
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y = {},
                    lualine_z = { { 'tabs',
                    tab_max_length = 40,
                    max_length = vim.o.columns / 3,
                    mode = 2,
                    show_modified_status = true,
                    symbols = { modified = '[+]', },
                    fmt = function(name, context)
                        local buflist = vim.fn.tabpagebuflist(context.tabnr)
                        local winnr = vim.fn.tabpagewinnr(context.tabnr)
                        local bufnr = buflist[winnr]
                        local mod = vim.fn.getbufvar(bufnr, '&mod')
                        return name .. (mod == 1 and ' +' or '')
                    end },},
                },
                winbar = {
                    lualine_a = {
                        {
                            'buffers',
                            show_filename_only = true,
                            hide_filename_extension = false,
                            show_modified_status = true,
                            mode = 4,
                            max_length = vim.o.columns * 2 / 3,
                            filetype_names = {
                                TelescopePrompt = 'Telescope',
                            },
                            symbols = {
                                modified = ' ●',
                                alternate_file = '#',
                                directory =  '',
                            },
                        }
                    },
                    lualine_b = {},
                    lualine_c = {},
                    lualine_x = {},
                    lualine_y ={
                        { 'filename',
                        file_status = true,
                        newfile_status = true,
                        path = 3,
                        shorting_target = 40,
                        symbols = {
                            modified = '[+]',
                            readonly = '[-]',
                            unnamed = '[No Name]',
                            newfile = '[New]', } }
                        },
                        lualine_z = {},
                    },
                }
            end
        },

}
