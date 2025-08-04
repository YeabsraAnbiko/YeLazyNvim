return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
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
      separator_style = "thin",         -- "slant" | "padded_slant" | "thick" | "thin" | {"", ""}
    },
  },
  config = function(_, opts)
    require("bufferline").setup(opts)
  end,
  keys = {
    { "<leader>1",  "<cmd>BufferLineGoToBuffer 1<cr>",  desc = "Go to Buffer 1" },
    { "<leader>2",  "<cmd>BufferLineGoToBuffer 2<cr>",  desc = "Go to Buffer 2" },
    { "<leader>3",  "<cmd>BufferLineGoToBuffer 3<cr>",  desc = "Go to Buffer 3" },
    { "<leader>4",  "<cmd>BufferLineGoToBuffer 4<cr>",  desc = "Go to Buffer 4" },
    { "<leader>5",  "<cmd>BufferLineGoToBuffer 5<cr>",  desc = "Go to Buffer 5" },
    { "<leader>6",  "<cmd>BufferLineGoToBuffer 6<cr>",  desc = "Go to Buffer 6" },
    { "<leader>7",  "<cmd>BufferLineGoToBuffer 7<cr>",  desc = "Go to Buffer 7" },
    { "<leader>8",  "<cmd>BufferLineGoToBuffer 8<cr>",  desc = "Go to Buffer 8" },
    { "<leader>9",  "<cmd>BufferLineGoToBuffer 9<cr>",  desc = "Go to Buffer 9" },
    { "<leader>$",  "<cmd>BufferLineGoToBuffer -1<cr>", desc = "Go to Last Buffer" },
    { "<leader>bq", ":Bdelete!<CR>",                    desc = "Close Current Buffer" },
    { "<leader>bQ", ":Bdelete! %d<CR>",                 desc = "Close Current Buffer Forcefully" },
    { "<leader>bn", "<cmd>BufferLineCycleNext<CR>",     desc = "Next Buffer" },
    { "<leader>bp", "<cmd>BufferLineCyclePrev<CR>",     desc = "Prev Buffer" },
  },
}
