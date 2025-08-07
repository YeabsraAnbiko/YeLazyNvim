return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      {
        "folke/lazydev.nvim",
        ft = "lua", -- only load on lua files
        opts = {
          library = {
            -- See the configuration section for more details
            -- Load luvit types when the `vim.uv` word is found
            { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          },
        },
      },
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
              -- Functions
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",

              -- Classes
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",

              -- Conditionals
              ["ai"] = "@conditional.outer",
              ["ii"] = "@conditional.inner",

              -- Loops
              ["al"] = "@loop.outer",
              ["il"] = "@loop.inner",

              -- Blocks
              ["ab"] = "@block.outer",
              ["ib"] = "@block.inner",

              -- Statements (e.g., return, throw)
              ["as"] = "@statement.outer",

              -- Parameters
              ["ap"] = "@parameter.outer",
              ["ip"] = "@parameter.inner",

              -- Calls (function calls)
              ["aC"] = "@call.outer",
              ["iC"] = "@call.inner",
            },
          },

          move = {
            enable = true,
            set_jumps = true,

            goto_next_start = {
              ["]f"] = "@function.outer",
              ["]c"] = "@class.outer",
              ["]p"] = "@parameter.inner",
              ["]l"] = "@loop.outer",
              ["]i"] = "@conditional.outer",
              ["]b"] = "@block.outer",
            },

            goto_previous_start = {
              ["[f"] = "@function.outer",
              ["[c"] = "@class.outer",
              ["[p"] = "@parameter.inner",
              ["[l"] = "@loop.outer",
              ["[i"] = "@conditional.outer",
              ["[b"] = "@block.outer",
            },

            goto_next_end = {
              ["]F"] = "@function.outer",
              ["]C"] = "@class.outer",
            },

            goto_previous_end = {
              ["[F"] = "@function.outer",
              ["[C"] = "@class.outer",
            },
          },

          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
        },
      }
    end,
  },
}
