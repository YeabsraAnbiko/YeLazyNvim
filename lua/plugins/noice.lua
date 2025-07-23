return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "SmiteshP/nvim-navic",
    },
    opts = {
      lsp = {
        progress = {
          enabled = true,
          format = "lsp_progress",
          format_done = "lsp_progress_done",
          throttle = 1000,
        },
        signature = {
          enabled = true,
        },
        hover = {
          enabled = true,
        },
        message = {
          enabled = true,
        },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },

      cmdline = {
        enabled = true,
        view = "cmdline_popup",
        format = {
          cmdline = { icon = "", title = "" },
          search_down = { icon = " ", title = "" },
          search_up = { icon = " ", title = "" },
          filter = { icon = "$", title = "" },
          lua = { icon = "", title = "" },
          help = { icon = "", title = "" },
        },
      },

      views = {
        cmdline_popup = {
          position = {
            row = "90%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
        popupmenu = {
          relative = "editor",
          position = {
            row = 8,
            col = "50%",
          },
          size = {
            width = 60,
            height = 10,
          },
          border = {
            style = "rounded",
            padding = { 0, 1 },
          },
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
        },
      },

      popupmenu = {
        enabled = true,
        backend = "nui",
      },

      messages = {
        enabled = true,
        view = "notify",
        view_error = "notify",
        view_warn = "notify",
        view_history = "messages",
        view_search = "virtualtext",
      },

      notify = {
        enabled = true,
        view = "notify",
      },

      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },

      throttle = 1000,

      smart_move = {
        enabled = true,
        excluded_filetypes = { "cmp_menu", "cmp_docs", "" },
      },

      routes = {},
    },
  },
}
