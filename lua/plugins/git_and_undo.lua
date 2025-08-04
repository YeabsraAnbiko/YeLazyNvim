return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",  -- required
      "sindrets/diffview.nvim", -- optional but recommended
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Neogit",
    keys = {
      { "<leader>gg", function() require("neogit").open() end, desc = "Open Neogit" },
    },
    config = function()
      require("neogit").setup({
        integrations = {
          diffview = true, -- enables diffview integration
        },
        signs = {
          section = { "▸", "▾" },
          item = { "▸", "▾" },
          hunk = { "", "" },
        },
        disable_commit_confirmation = true,
        disable_insert_on_commit = false,
        use_magit_keybindings = false,
      })
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local gs = require("gitsigns")

      gs.setup({
        signs                   = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "▎" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "┆" },
        },
        signcolumn              = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl                   = false, -- Toggle with `:Gitsigns toggle_numhl`
        linehl                  = false, -- Toggle with `:Gitsigns toggle_linehl`
        word_diff               = false, -- Toggle with `:Gitsigns toggle_word_diff`
        current_line_blame      = true,
        current_line_blame_opts = {
          virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 100,
          ignore_whitespace = false,
        },
      })
    end,
    keys = {
      {
        "]c",
        function()
          if vim.wo.diff then return "]c" end
          vim.schedule(require("gitsigns").next_hunk)
          return "<Ignore>"
        end,
        desc = "Next Git hunk",
        expr = true,
      },
      {
        "[c",
        function()
          if vim.wo.diff then return "[c" end
          vim.schedule(require("gitsigns").prev_hunk)
          return "<Ignore>"
        end,
        desc = "Previous Git hunk",
        expr = true,
      },

      -- Actions (normal mode)
      { "<leader>hs", function() require("gitsigns").stage_hunk() end,      desc = "Stage hunk" },
      { "<leader>hr", function() require("gitsigns").reset_hunk() end,      desc = "Reset hunk" },
      { "<leader>hS", function() require("gitsigns").stage_buffer() end,    desc = "Stage buffer" },
      { "<leader>hu", function() require("gitsigns").undo_stage_hunk() end, desc = "Undo stage hunk" },
      { "<leader>hR", function() require("gitsigns").reset_buffer() end,    desc = "Reset buffer" },
      { "<leader>hp", function() require("gitsigns").preview_hunk() end,    desc = "Preview hunk" },
      {
        "<leader>hb",
        function() require("gitsigns").blame_line { full = true } end,
        desc = "Blame line (full)",
      },
      { "<leader>tb", function() require("gitsigns").toggle_current_line_blame() end, desc = "Toggle current line blame" },
      { "<leader>hd", function() require("gitsigns").diffthis() end,                  desc = "Git diff" },
      { "<leader>hD", function() require("gitsigns").diffthis("~") end,               desc = "Git diff ~" },
      { "<leader>td", function() require("gitsigns").toggle_deleted() end,            desc = "Toggle deleted lines" },

      -- Actions (visual mode)
      {
        "<leader>hs",
        function() require("gitsigns").stage_hunk { vim.fn.line("."), vim.fn.line("v") } end,
        mode = "v",
        desc = "Stage hunk (visual)",
      },
      {
        "<leader>hr",
        function() require("gitsigns").reset_hunk { vim.fn.line("."), vim.fn.line("v") } end,
        mode = "v",
        desc = "Reset hunk (visual)",
      },
    },
  },

  {
    'mbbill/undotree',
    config = function()
      local home = os.getenv("HOME") or os.getenv("USERPROFILE") -- Windows fallback
      vim.opt.undodir = home .. "/.nvim/undodir"
    end,
    keys = {
      { "<leader>U", ":UndotreeToggle<CR>", desc = "Toggle Undotree" },
    },
  },
}
