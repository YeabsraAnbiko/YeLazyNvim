return {
  {
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-telescope/telescope-ui-select.nvim',
    },
    config = function()
      local actions = require('telescope.actions')

      require('telescope').setup({
        defaults = {
          prompt_prefix = "🔍 ",
          selection_caret = " ",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              preview_width = 0.6,
            },
            vertical = {
              preview_height = 0.6,
            },
          },
          file_ignore_patterns = { "node_modules", ".git/", "dist", "target", "%.lock" },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<c-c>"] = actions.close,
              ["<Down>"] = require('telescope.actions').cycle_history_next,
              ["<Up>"] = require('telescope.actions').cycle_history_prev,
            },
            n = {
              ["q"] = actions.close,
            }
          },
          path_display = {"filename_first"}
        },
        pickers = {},
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({
              winblend = 35,
              prompt_title = false,
              results_title = false,
              sorting_strategy = "ascending",
              layout_config = {
                width = 0.4,
                height = 0.3,
              },
            })
          },
        },
      })

      require('telescope').load_extension('fzf')
      require('telescope').load_extension('ui-select')

      local builtin = require('telescope.builtin')

      -- File Search
      vim.keymap.set('n', '<leader>ff', function() builtin.find_files({
        hidden = true,
        layout_config = {
          prompt_position = "top",
        }
      }) end, { desc = 'Find Files' })
      vim.keymap.set('n', '<leader>fh', builtin.oldfiles, { desc = 'Recent Files' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
      vim.keymap.set('n', '<leader>fg',function () builtin.live_grep({
        layout_config = {
          prompt_position = "top",
        }

      }) end, { desc = 'Live Grep' })
      vim.keymap.set('n', '<leader>ll',function() builtin.current_buffer_fuzzy_find({
        layout_config = {
          prompt_position = "top",
        }

      }) end, { desc = 'Fuzzy Current Buffer' })
      vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Resume Last Search' })

      -- Git
      vim.keymap.set('n', '<leader>Gf', function() builtin.git_files({
        layout_config = {
          prompt_position = "top",
        }


      }) end, { desc = 'Git Files' })
      vim.keymap.set('n', '<leader>Gl', function() builtin.git_commits({
        layout_config = {
          prompt_position = "top",
        }

      }) end, { desc = 'Git Commits' })
      vim.keymap.set('n', '<leader>Gd', function() builtin.git_bcommits({
        layout_config = {
          prompt_position = "top",
        }

      }) end, { desc = 'Git Buffer Commits' })
      vim.keymap.set('n', '<leader>Gs', function() builtin.git_status({
        layout_config = {
          prompt_position = "top",
        }

      }) end, { desc = 'Git Status' })
      vim.keymap.set('n', '<leader>Gb', function() builtin.git_branches({
        layout_config = {
          prompt_position = "top",
        }

      }) end, { desc = 'Git Branches' })

      -- LSP 
      vim.keymap.set('n', '<leader>sd', function()
        builtin.lsp_definitions({
          jump_type =  {"split",}
        })
      end, { desc = 'LSP Definitions' })
      vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, { desc = 'Document Symbols' })

      -- Others
      vim.keymap.set('n', '<leader>cs', builtin.colorscheme, { desc = 'Colorscheme' })
      vim.keymap.set('n', '<leader>rg', builtin.registers, { desc = 'Registers' })
      vim.keymap.set('n', '<leader>tr', builtin.treesitter, { desc = 'Treesitter' })
      vim.keymap.set('n', '<leader>sp', builtin.spell_suggest, { desc = 'Spell Suggest' })
      vim.keymap.set('n', '<leader>vo', builtin.vim_options, { desc = 'Vim Options' })
      vim.keymap.set('n', '<leader>cm', builtin.commands, { desc = 'Commands' })
      vim.keymap.set('n', '<leader>sh',function() builtin.help_tags({
        layout_config = {
          prompt_position = "top",
        }
      }) end, { desc = 'Help Tags' })
      vim.keymap.set('n', '<leader>sm',function() builtin.man_pages({
        layout_config = {
          prompt_position = "top",
        }
      }) end, { desc = 'Man Pages' })
      vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search Keymaps' })
    end
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build = 'make',
    cond = vim.fn.executable("make") == 1,
  },
  {
    'nvim-telescope/telescope-ui-select.nvim'
  }
}

