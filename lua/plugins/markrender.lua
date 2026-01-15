return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  keys = {
    { "<leader>mp", "<cmd>RenderMarkdown toggle<cr>", desc = "Toggle RenderMarkdown" },
  },
  opts = {
    enabled = false,
    preset = "obsidian",
    file_types = { "markdown" },
    nested = false,
    heading = {
      width = "block",
    },
  },
}
