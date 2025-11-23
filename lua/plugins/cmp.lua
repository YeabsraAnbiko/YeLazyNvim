return {
  {
    "hrsh7th/nvim-cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "onsails/lspkind.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-cmdline",
    },
    config = function()
      local lspkind = require("lspkind")
      lspkind.init({
        symbol_map = {
          Copilot = "",
          Text = "",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰇽",
          Variable = "󰂡",
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "",
          Event = "",
          Operator = "󰆕",
          TypeParameter = "",
        },
      })

      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            border = "double",
          }),
          documentation = cmp.config.window.bordered({
            border = "single",
          }),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = function(fallback)
            if cmp.visible() then
              cmp.scroll_docs(-4)
            else
              fallback()
            end
          end,
          ["<C-f>"] = function(fallback)
            if cmp.visible() then
              cmp.scroll_docs(4)
            else
              fallback()
            end
          end,
          ["<C-Space>"] = function()
            if cmp.visible() then
              cmp.close()
            else
              cmp.complete()
            end
          end,
          ["<CR>"] = function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
              cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
            else
              fallback()
            end
          end,
          ["<Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end,
          ["<S-Tab>"] = function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end,
        }),
        completion = {
          completeopt = "menu,menuone,noselect",
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp", group_index = 1 },
          { name = "luasnip", group_index = 5 },
          { name = "path", group_index = 4 },
          { name = "buffer", group_index = 3 },
          { name = "copilot", group_index = 2 },
        }),
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline" },
        }, {
          { name = "buffer" },
          { name = "nvim_lua" },
        }),
      })
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    lazy = false,
    build = "make install_jsregexp",
    config = function()
      require("luasnip.loaders.from_vscode").lazy_load()
    end,
  },
}
