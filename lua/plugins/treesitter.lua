return{
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "HiPhish/nvim-ts-rainbow2",
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
      rainbow = {
        enable = true,
        query = "rainbow-parens",
        strategy = require("ts-rainbow.strategy.global"),
      },
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
}
