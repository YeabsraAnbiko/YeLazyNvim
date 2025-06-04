return {
{
  "christoomey/vim-tmux-navigator",
  lazy = false,
  init = function()
    -- Disable default key mappings
    vim.g.tmux_navigator_no_mappings = 1

    -- Custom keybindings for Alt + h/j/k/l
    local map = vim.keymap.set
    local opts = { noremap = true, silent = true }

    map("n", "<M-h>", ":TmuxNavigateLeft<CR>", opts)
    map("n", "<M-j>", ":TmuxNavigateDown<CR>", opts)
    map("n", "<M-k>", ":TmuxNavigateUp<CR>", opts)
    map("n", "<M-l>", ":TmuxNavigateRight<CR>", opts)
  end,
}
}
