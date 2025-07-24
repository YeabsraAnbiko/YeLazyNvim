return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "OXY2DEV/markview.nvim",
    },
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "lua", "python", "javascript", "typescript", "json", "yaml", "toml",
          "html", "css", "markdown", "bash", "vim", "rust", "go", "c", "cpp"
        },
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "gnn",
            node_incremental = "grn",
            scope_incremental = "grc",
            node_decremental = "grm",
          },
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,
            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
            },
          },
        },
      }
    end,
  },
  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    opts = {
      markdown = {
        enable = true,
        parser = "markdown",
        filetype = "markdown",
      },
      textobjects = {
        enable = true,
        parser = "markdown",
        filetype = "markdown",
      },
    },
    config = function()
      require("markview").setup({
        experimental = {
          check_rtp = false,   -- disables the runtime path check entirely
          check_rtp_message = false, -- just hides the message
        }
      })
    end,
  },
}
