return {
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
    keys = {
      { "<M-h>", ":TmuxNavigateLeft<CR>" },
      { "<M-j>", ":TmuxNavigateDown<CR>" },
      { "<M-k>", ":TmuxNavigateUp<CR>" },
      { "<M-l>", ":TmuxNavigateRight<CR>" },
    },
  }
}
