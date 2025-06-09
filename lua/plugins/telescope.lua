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
              ["<esc>"] = actions.close,
              ["<c-c>"] = actions.close,
            },
            n = {
              ["q"] = actions.close,
            }
          },
        },
        pickers = {},
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({})
          },
        },
      })

      require('telescope').load_extension('fzf')
      require('telescope').load_extension('ui-select')

      local builtin = require('telescope.builtin')

      -- File Search
      vim.keymap.set('n', '<leader>ff', function() builtin.find_files({hidden=true}) end, { desc = 'Find Files' })
      vim.keymap.set('n', '<leader>fh', builtin.oldfiles, { desc = 'Recent Files' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Buffers' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Live Grep' })
      vim.keymap.set('n', '<leader>ll', builtin.current_buffer_fuzzy_find, { desc = 'Fuzzy Current Buffer' })
      vim.keymap.set('n', '<leader>fr', builtin.resume, { desc = 'Resume Last Search' })

      -- Git
      vim.keymap.set('n', '<leader>Gf', builtin.git_files, { desc = 'Git Files' })
      vim.keymap.set('n', '<leader>Gl', builtin.git_commits, { desc = 'Git Commits' })
      vim.keymap.set('n', '<leader>Gd', builtin.git_bcommits, { desc = 'Git Buffer Commits' })
      vim.keymap.set('n', '<leader>Gs', builtin.git_status, { desc = 'Git Status' })
      vim.keymap.set('n', '<leader>Gb', builtin.git_branches, { desc = 'Git Branches' })

      -- LSP 
      vim.keymap.set('n', '<leader>sd', builtin.lsp_definitions, { desc = 'LSP Definitions' })
      vim.keymap.set('n', '<leader>sr', builtin.lsp_references, { desc = 'LSP References' })
      vim.keymap.set('n', '<leader>sI', builtin.lsp_implementations, { desc = 'LSP Implementations' })
      vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols, { desc = 'Document Symbols' })

      -- Others
      vim.keymap.set('n', '<leader>cs', builtin.colorscheme, { desc = 'Colorscheme' })
      vim.keymap.set('n', '<leader>rg', builtin.registers, { desc = 'Registers' })
      vim.keymap.set('n', '<leader>tr', builtin.treesitter, { desc = 'Treesitter' })
      vim.keymap.set('n', '<leader>sp', builtin.spell_suggest, { desc = 'Spell Suggest' })
      vim.keymap.set('n', '<leader>vo', builtin.vim_options, { desc = 'Vim Options' })
      vim.keymap.set('n', '<leader>cm', builtin.commands, { desc = 'Commands' })
      vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Help Tags' })
      vim.keymap.set('n', '<leader>sm', builtin.man_pages, { desc = 'Man Pages' })
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

