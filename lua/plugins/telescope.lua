return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make", cond = vim.fn.executable("make") == 1 },
      "nvim-telescope/telescope-ui-select.nvim",
    },

    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      local themes = require("telescope.themes")

      telescope.setup({
        defaults = {
          sorting_strategy = "ascending",
          prompt_prefix = "🔍 ",
          selection_caret = " ",
          path_display = { "filename_first" },

          layout_strategy = "horizontal",
          layout_config = {
            prompt_position = "top",
            horizontal = { preview_width = 0.6 },
            vertical = { preview_height = 0.6 },
          },

          file_ignore_patterns = {
            "node_modules",
            "%.git/",
            "dist",
            "target",
            "%.lock",
          },

          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-c>"] = actions.close,
              ["<Down>"] = actions.cycle_history_next,
              ["<Up>"] = actions.cycle_history_prev,
            },
            n = {
              ["q"] = actions.close,
            },
          },
        },

        pickers = {
          find_files = { hidden = true },
          buffers = { sort_lastused = true },
          colorscheme = themes.get_dropdown(),
          registers = themes.get_ivy(),
          keymaps = themes.get_ivy(),
          vim_options = themes.get_ivy(),
          commands = themes.get_ivy(),
          spell_suggest = themes.get_cursor(),
          treesitter = {
            layout_config = { prompt_position = "top" },
          },
        },

        extensions = {
          ["ui-select"] = themes.get_dropdown({}),
        },
      })

      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
    end,

    keys = {
      -- Files & buffers
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Find Files",
      },
      {
        "<leader>fh",
        function()
          require("telescope.builtin").oldfiles()
        end,
        desc = "Recent Files",
      },
      {
        "<leader>fb",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Buffers",
      },

      -- Search

      { "<leader>sp", require("telescope.builtin").spell_suggest, desc = "Spell Suggest" },
      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Live Grep",
      },
      {
        "<leader>gs",
        function()
          require("telescope.builtin").grep_string()
        end,
        desc = "Search Word Under Cursor",
      },
      {
        "<leader>ll",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find()
        end,
        desc = "Fuzzy Current Buffer",
      },

      -- LSP / code
      {
        "<leader>ss",
        function()
          require("telescope.builtin").lsp_document_symbols()
        end,
        desc = "Document Symbols",
      },
      {
        "<leader>tr",
        function()
          require("telescope.builtin").treesitter()
        end,
        desc = "Treesitter Symbols",
      },

      -- UI / misc
      {
        "<leader>cs",
        function()
          require("telescope.builtin").colorscheme()
        end,
        desc = "Colorscheme",
      },
      {
        "<leader>rg",
        function()
          require("telescope.builtin").registers()
        end,
        desc = "Registers",
      },
      {
        "<leader>vo",
        function()
          require("telescope.builtin").vim_options()
        end,
        desc = "Vim Options",
      },
      {
        "<leader>cm",
        function()
          require("telescope.builtin").commands()
        end,
        desc = "Commands",
      },
      {
        "<leader>sk",
        function()
          require("telescope.builtin").keymaps()
        end,
        desc = "Keymaps",
      },
      {
        "<leader>sh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Help Tags",
      },
      {
        "<leader>sm",
        function()
          require("telescope.builtin").man_pages()
        end,
        desc = "Man Pages",
      },

      -- Git
      {
        "<leader>Gf",
        function()
          require("telescope.builtin").git_files()
        end,
        desc = "Git Files",
      },

      -- Resume
      {
        "<leader>fr",
        function()
          require("telescope.builtin").resume()
        end,
        desc = "Resume Last Picker",
      },
    },
  },
}
