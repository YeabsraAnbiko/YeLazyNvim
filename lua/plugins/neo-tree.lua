return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    lazy = false,
    keys = {
      { "<leader>e", "<cmd>Neotree toggle right<cr>", desc = "Toggle NeoTree" },
      { "<leader>ns", "<cmd>Neotree document_symbols right<cr>", desc = "Document Symbols" },
      { "<leader>fs", "<cmd>Neotree filesystem float<cr>", desc = "Floating Filesystem Tree" },
    },
    config = function()
      require("neo-tree").setup({
        sources = { "filesystem", "buffers", "git_status", "document_symbols" },
        close_if_last_window = false,
        popup_border_style = "rounded",
        enable_git_status = true,
        enable_diagnostics = true,
        open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
        open_files_using_relative_paths = false,
        sort_case_insensitive = false,
        default_component_configs = {
          container = { enable_character_fade = true },
          indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            highlight = "NeoTreeIndentMarker",
            expander_collapsed = "",
            expander_expanded = "",
            expander_highlight = "NeoTreeExpander",
          },
          icon = {
            folder_empty_open = "",
            use_filtered_colors = true,
            folder_closed = "",
            folder_open = "",
            folder_empty = "",
            default = "", --
            highlight = "NeoTreeFileIcon",
          },
          modified = {
            symbol = "[+]",
            highlight = "NeoTreeModified",
          },
          name = {
            trailing_slash = false,
            use_git_status_colors = true,
            highlight = "NeoTreeFileName",
          },
          git_status = {
            symbols = {
              added = "✚",
              modified = "",
              deleted = "✖",
              renamed = "󰁕",
              untracked = "",
              ignored = "",
              unstaged = "󰄱",
              staged = "",
              conflict = "",
            },
          },
          file_size = {
            enabled = true,
            width = 12,
            required_width = 64,
          },
          type = {
            enabled = true,
            width = 10,
            required_width = 122,
          },
          last_modified = {
            format = "%Y-%m-%d %H:%M",
            enabled = true,
            width = 20,
            required_width = 88,
          },
          created = {
            format = "%Y-%m-%d %H:%M",
            enabled = true,
            width = 20,
            required_width = 110,
          },
          symlink_target = {
            enabled = false,
          },
        },
        window = {
          position = "left",
          width = 40,
          mapping_options = {
            noremap = true,
            nowait = true,
          },
          mappings = {
            ["<c-space>"] = { "toggle_node", nowait = false },
            ["<2-LeftMouse>"] = "open",
            ["<cr>"] = "open",
            ["<esc>"] = "cancel",
            ["P"] = { "toggle_preview", config = { use_float = true, use_image_nvim = true } },
            ["l"] = "focus_preview",
            ["S"] = "open_split",
            ["s"] = "open_vsplit",
            ["t"] = "open_tabnew",
            ["w"] = "open_with_window_picker",
            ["C"] = "close_node",
            ["z"] = "close_all_nodes",
            ["r"] = "rename",
            ["q"] = "close_window",
            ["R"] = "refresh",
            ["?"] = "show_help",
            ["<"] = "prev_source",
            [">"] = "next_source",
          },
        },
        filesystem = {
          filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true,
            hide_ignored = true,
          },
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
          group_empty_dirs = false,
          hijack_netrw_behavior = "open_current",
          use_libuv_file_watcher = true,
          window = {
            mappings = {
              ["<bs>"] = "navigate_up",
              ["-"] = "navigate_up",
              ["u"] = "navigate_up",
              ["."] = "set_root",
              ["H"] = "toggle_hidden",
              ["f"] = "fuzzy_finder",
              ["F"] = "fuzzy_finder_directory",
              ["#"] = "fuzzy_sorter",
              ["*"] = "fuzzy_sorter_directory",
              ["/"] = "filter_on_submit",
              ["<c-x>"] = "clear_filter",
              ["[g"] = "prev_git_modified",
              ["]g"] = "next_git_modified",
              ["R"] = "refresh",
              ["a"] = { "add", config = { show_path = "relative" } },
              ["d"] = "add_directory",
              ["D"] = "delete",
              ["i"] = "show_file_details",
            },
          },
        },
        buffers = {
          follow_current_file = {
            enabled = true,
            leave_dirs_open = false,
          },
          group_empty_dirs = true,
          show_unloaded = true,
          window = {
            mappings = {
              ["D"] = "buffer_delete",
              ["<bs>"] = "navigate_up",
              ["u"] = "navigate_up",
              ["-"] = "navigate_up",
              ["."] = "set_root",
              ["R"] = "refresh",
            },
          },
        },
        git_status = {
          window = {
            mappings = {
              ["a"] = "git_add_all",
              ["gu"] = "git_unstage_file",
              ["ga"] = "git_add_file",
              ["gr"] = "git_revert_file",
              ["gc"] = "git_commit",
              ["gp"] = "git_push",
              ["gg"] = "git_commit_and_push",
            },
          },
        },
        document_symbols = {
          follow_cursor = true,
        },
      })
    end,
  },
  {
    "antosha417/nvim-lsp-file-operations",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-neo-tree/neo-tree.nvim",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
  {
    "s1n7ax/nvim-window-picker",
    event = "VeryLazy",
    version = "2.*",
    config = function()
      require("window-picker").setup({
        hint = "floating-big-letter",
        filter_rules = {
          include_current_win = false,
          autoselect_one = true,
          bo = {
            filetype = { "neo-tree", "neo-tree-popup", "notify" },
            buftype = { "terminal", "quickfix" },
          },
        },
      })
    end,
  },
}
