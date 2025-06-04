return {
  {
      "mason-org/mason.nvim",
    cmd = "Mason",
    opts = {
      ui = {
        border = "rounded",
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    },
  },

  -- mason-lspconfig: bridge between mason & lspconfig
  {
    "mason-org/mason-lspconfig.nvim",
    lazy = false,
    dependencies = {
        { "mason-org/mason.nvim", opts = {} },
        "neovim/nvim-lspconfig",
    },

    opts = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local on_attach = function(_, bufnr)
        local map = vim.keymap.set
        local opts = { buffer = bufnr }

        map("n", "gd", vim.lsp.buf.definition, opts)
        map("n", "gD", vim.lsp.buf.declaration, opts)
        map("n", "gr", vim.lsp.buf.references, opts)
        map("n", "<leader>rn", vim.lsp.buf.rename, opts)
        map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
        map("n", "<c-k>", vim.lsp.buf.signature_help, opts)
        map("n", "k", vim.lsp.buf.hover, opts)
        map("n", "[d", vim.diagnostic.goto_prev, opts)
        map("n", "]d", vim.diagnostic.goto_next, opts)
        map("n", "<leader>d", vim.diagnostic.open_float, opts)
      end

      return {
        ensure_installed = {
          "lua_ls", "emmet_language_server", "clangd", "bashls", "cssls",
          "html", "vtsls", "jsonls", "marksman", "pyright", "pylsp",
          "sqlls", "vimls", "grammarly",
        },

        handlers = {
  function(server_name)
    require("lspconfig")[server_name].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end,
  lua_ls = function()
    require("lspconfig").lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
        },
      },
      capabilities = capabilities,
      on_attach = on_attach,
    })
  end
},
      }
    end,
  },

  -- -- lspconfig: just for global diagnostic settings
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "mason-org/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      vim.opt.signcolumn = "yes"

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })
    end,
  },

  -- -- nvim-cmp (autocomplete)
  {
    "hrsh7th/nvim-cmp",
    event = "insertenter",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-buffer",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        sources = {
  { name = "nvim_lsp" },
  { name = "path" },
  { name = "buffer" },
  { name = "luasnip" },
},

mapping = cmp.mapping.preset.insert({
  ["<c-space>"] = cmp.mapping.complete(),
  ["<cr>"] = cmp.mapping.confirm({ select = true }),
  ["<tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
  ["<s-tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
}),
        completion = {
          completeopt = "menu,menuone,noselect",
        },
      })
    end,
  },
}

