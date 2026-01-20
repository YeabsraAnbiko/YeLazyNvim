return {
  "yetone/avante.nvim",
  event = "VeryLazy",
  build = "make",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "stevearc/dressing.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("avante").setup({
      provider = "gemini",
      providers = {
        gemini = {
          model = "gemini-2.5-flash-lite",
          temperature = 0,
          max_tokens = 1024,
        },
      },
    })
  end,
}
