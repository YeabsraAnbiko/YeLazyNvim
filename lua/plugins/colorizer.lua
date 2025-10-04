return {
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "*",
        css = { rgb_fn = true },
      }, {
        names = false,
        RRGGBBAA = true,
      })
    end,
  },
}
