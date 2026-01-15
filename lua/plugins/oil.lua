return {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = false,
  },
  keys = {
    {
      "-",
      "<cmd>Oil<CR>",
      desc = "Open Oil",
    },
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
}
