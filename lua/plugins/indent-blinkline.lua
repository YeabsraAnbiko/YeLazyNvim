return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = {
        char = "│",
        tab_char = "│",
        highlight = {
          "IblIndent"
        },
      },
      whitespace = {
        remove_blankline_trail = true,
      },
      scope = {
        enabled = true,
        show_start = false,
        show_end = false,
        include = {
          node_type = {
            ["*"] = {
              "block",
              "list",
              "statement_block",
              "object",
              "arguments",
              "element",
              "table",
              "do_block",
              "function",
              "arguments",
              "if_statement",
              "else_clause",
              "while_statement",
              "for_statement",
              "with_statement",
              "try_statement",
              "catch_clause",
              "finally_clause",
            },
          },
        },
        highlight = {
          "IblScope"
        },
      },
    },
    config = function(_, opts)
      -- Custom highlights
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#3E4452" }) -- Dim gray lines
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#61AFEF" })  -- Blue for active scope

      require("ibl").setup(opts)
    end,
  },
}

