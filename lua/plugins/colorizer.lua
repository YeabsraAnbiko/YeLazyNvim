return {
    {
        "norcalli/nvim-colorizer.lua",
        config = function()
            require("colorizer").setup({
                "*", -- Highlight all filetypes
                css = { rgb_fn = true; }, -- Enable parsing `rgb(...)` etc.
            })

        end,
    }
}
