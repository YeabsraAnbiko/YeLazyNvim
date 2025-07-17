return {
  "github/copilot.vim",
  lazy = false, -- ← force it to load immediately
  config = function()
    vim.g.copilot_no_tab_map = true
    vim.api.nvim_set_keymap("i", "<C-y>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
  end,
  opt = {
    copilot_node_command = "node", -- Ensure this points to your Node.js installation
    copilot_filetypes = {
    },
  },
}

