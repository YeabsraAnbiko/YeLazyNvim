return {
  {
    'nvim-lualine/lualine.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      'SmiteshP/nvim-navic', -- navic support for breadcrumbs
    },
    config = function()
      local navic = require("nvim-navic")

      require('lualine').setup {
        options = {
          icons_enabled = true,
          theme = 'auto', -- or any other theme you prefer
          -- component_separators = { left = '', right = '' },
          component_separators = { left = '│', right = '│' },
          section_separators = { left = '', right = '' },
          always_divide_middle = true,
          globalstatus = true,
          refresh = {
            statusline = 100,
            tabline = 100,
            winbar = 100,
          }
        },
        winbar = {
          lualine_b = { 'lsp_status' },
          lualine_c = {
            {
              function()
                return navic.is_available() and navic.get_location() or ''
              end,
              cond = function()
                return navic.is_available()
              end
            }
          },
        },
        sections = {
          lualine_a = { 'mode' },
          lualine_b = { 'branch', 'diff' },
          lualine_c = { 'diagnostics' },
          lualine_x = { 'encoding', 'fileformat', 'filetype' },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = { 'filename' },
          lualine_x = { 'location' },
          lualine_y = {},
          lualine_z = {},
        },
      }
    end
  }
}
