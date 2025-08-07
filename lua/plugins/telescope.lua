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
          path_display = { "filename_first" }
        },
        pickers = {
          lsp_document_symbols = {
            layout_config = {
              prompt_position = "top",
            },
          },
          find_files = {
            hidden = true,
            layout_config = {
              prompt_position = "top",
            }
          },
          live_grep = {
            layout_config = {
              prompt_position = "top",
            }
          },
          current_buffer_fuzzy_find = {
            layout_config = {
              prompt_position = "top",
            }
          },
          oldfiles = {
            layout_config = {
              prompt_position = "top",
            }
          },
          buffers = {
            sort_lastused = true,
            layout_config = {
              prompt_position = "top",
            }
          },
          man_pages = {
            layout_config = {
              prompt_position = "top",
            }
          },
          colorscheme = {
            theme = "dropdown",
          },
          registers = {
            theme = "ivy",
            layout_config = {
              prompt_position = "top",
            }
          },
          spell_suggest = {
            theme = "cursor",
          },
          help_tags = {
            layout_config = {
              prompt_position = "top",
            }
          },
          keymaps = {
            theme = "ivy",
          },
          treesitter = {
            layout_config = {
              prompt_position = "top",
            }
          },
          vim_options = {
            theme = "ivy",
          },
          commands = {
            theme = "ivy",
          },
        },
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
    end,
    keys = {
      { "<leader>ff", require('telescope.builtin').find_files,                desc = 'Find Files' },
      { "<leader>fh", require('telescope.builtin').oldfiles,                  desc = 'Recent Files' },
      { "<leader>fb", require('telescope.builtin').buffers,                   desc = 'Buffers' },
      { "<leader>fg", require('telescope.builtin').live_grep,                 desc = 'Live Grep' },
      { "<leader>ll", require('telescope.builtin').current_buffer_fuzzy_find, desc = 'Fuzzy Current Buffer' },
      { "<leader>fr", require('telescope.builtin').resume,                    desc = 'Resume Last Search' },
      { "<leader>ss", require('telescope.builtin').lsp_document_symbols,      desc = 'Document Symbols' },
      { "<leader>sp", require('telescope.builtin').spell_suggest,             desc = 'Spell Suggest' },
      { "<leader>cs", require('telescope.builtin').colorscheme,               desc = 'Colorscheme' },
      { "<leader>rg", require('telescope.builtin').registers,                 desc = 'Registers' },
      { "<leader>tr", require('telescope.builtin').treesitter,                desc = 'Treesitter' },
      { "<leader>sp", require('telescope.builtin').spell_suggest,             desc = 'Spell Suggest' },
      { "<leader>vo", require('telescope.builtin').vim_options,               desc = 'Vim Options' },
      { "<leader>cm", require('telescope.builtin').commands,                  desc = 'Commands' },
      { "<leader>sk", require('telescope.builtin').keymaps,                   desc = 'Search Keymaps' },
      { "<leader>sh", require('telescope.builtin').help_tags,                 desc = 'Help Tags' },
      { "<leader>sm", require('telescope.builtin').man_pages,                 desc = 'Man Pages' },
      { "<leader>gs", require('telescope.builtin').grep_string,               desc = 'Search Under Cursor or Selection' },
      { '<leader>Gf', require('telescope.builtin').git_files,                 desc = 'Git Files' },
      { '<leader>ta', require('telescope.builtin').tags,                      desc = 'List Tags' },
    },
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
