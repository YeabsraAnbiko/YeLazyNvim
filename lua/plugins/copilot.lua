return {
  "github/copilot.vim",
  lazy = false, -- ← force it to load immediately
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-,>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  end,
}

