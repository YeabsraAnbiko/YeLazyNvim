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
      { "<leader>e", "<cmd>Neotree toggle left<cr>", desc = "Toggle Neo-tree" },
      { "<leader>ns", "<cmd>Neotree document_symbols right<cr>", desc = "Document Symbols" },
      { "<leader>fs", "<cmd>Neotree filesystem float<cr>", desc = "Floating Filesystem" },
    },

    config = function()
      local telescope = require("telescope.builtin")

      local icons = {
        folder_closed = "",
        folder_open = "",
        folder_empty = "",
        default_file = "",
      }

      require("neo-tree").setup({
        sources = { "filesystem", "buffers", "git_status", "document_symbols" },

        close_if_last_window = false,
        popup_border_style = "rounded",

        enable_git_status = true,
        enable_diagnostics = true,

        open_files_do_not_replace_types = { "terminal", "trouble", "qf" },

        default_component_configs = {
          container = {
            enable_character_fade = true,
          },

          indent = {
            indent_size = 2,
            padding = 1,
            with_markers = true,
            indent_marker = "│",
            last_indent_marker = "└",
            expander_collapsed = "",
            expander_expanded = "",
          },

          icon = {
            folder_closed = icons.folder_closed,
            folder_open = icons.folder_open,
            folder_empty = icons.folder_empty,
            folder_empty_open = icons.folder_open,
            default = icons.default_file,
            use_filtered_colors = true,
          },

          modified = {
            symbol = "[+]",
          },

          name = {
            trailing_slash = false,
            use_git_status_colors = true,
          },

          git_status = {
            symbols = {
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

          file_size = { enabled = true },
          type = { enabled = true },
          last_modified = { enabled = true, format = "%Y-%m-%d %H:%M" },
          created = { enabled = true, format = "%Y-%m-%d %H:%M" },
        },

        window = {
          position = "left",
          width = 40,

          mappings = {
            ["<c-space>"] = { "toggle_node", nowait = false },
            ["<esc>"] = "cancel",
            ["q"] = "close_window",
            ["P"] = { "toggle_preview", config = { use_float = true } },

            ["s"] = "open_vsplit",
            ["S"] = "open_split",
            ["t"] = "open_tabnew",

            ["z"] = "close_all_nodes",
            ["C"] = "close_node",
            ["R"] = "refresh",

            ["<"] = "prev_source",
            [">"] = "next_source",
            ["?"] = "show_help",
          },
        },

        filesystem = {
          follow_current_file = {
            enabled = true,
          },

          hijack_netrw_behavior = "open_current",
          use_libuv_file_watcher = true,

          filtered_items = {
            visible = false,
            hide_dotfiles = true,
            hide_gitignored = true,
            hide_hidden = true,
          },

          window = {
            mappings = {
              ["-"] = "navigate_up",
              ["u"] = "navigate_up",
              ["H"] = "toggle_hidden",

              ["<leader>g"] = function()
                telescope.live_grep({
                  cwd = require("neo-tree.sources.manager").get_state("filesystem").path,
                })
              end,
              ["f"] = function()
                telescope.find_files({
                  cwd = require("neo-tree.sources.manager").get_state("filesystem").path,
                  hidden = true,
                })
              end,

              ["F"] = "fuzzy_finder_directory",
              ["/"] = "filter_on_submit",
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
          },
          group_empty_dirs = true,
          show_unloaded = true,

          window = {
            mappings = {
              ["D"] = "buffer_delete",
              ["-"] = "navigate_up",
            },
          },
        },

        git_status = {
          window = {
            mappings = {
              ["ga"] = "git_add_file",
              ["gu"] = "git_unstage_file",
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
}
