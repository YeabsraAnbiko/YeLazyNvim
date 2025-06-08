-- lua/plugins/bufferline.lua
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "buffers", -- also try "tabs"
      numbers = "none", -- or "ordinal" | "buffer_id"
      close_command = "bdelete! %d",
      right_mouse_command = "bdelete! %d",
      indicator = {
        icon = "▎", -- could be "", "▎", or ""
        style = "icon",
      },
      buffer_close_icon = "󰅖",
      modified_icon = "●",
      close_icon = "",
      left_trunc_marker = "",
      right_trunc_marker = "",
      diagnostics = "nvim_lsp",
      diagnostics_update_in_insert = false,
      offsets = {
        {
          filetype = "neo-tree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
      show_buffer_icons = true,
      show_buffer_close_icons = true,
      show_close_icon = true,
      show_tab_indicators = true,
      persist_buffer_sort = true,
      enforce_regular_tabs = false,
      always_show_bufferline = true,
      sort_by = "insert_after_current", -- or "id", "extension", "relative_directory"
      separator_style = "thin", -- "slant" | "padded_slant" | "thick" | "thin" | {"", ""}
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
    vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next Buffer" })
    vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev Buffer" })
  end,
}

