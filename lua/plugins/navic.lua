return {
  {
    "SmiteshP/nvim-navic",
    lazy = true,
    dependencies = {
      "neovim/nvim-lspconfig"
    },
    opts = {
      highlight = true,
      separator = " > ",
      depth_limit = 0,
      lsp = {
        auto_attach = true,
        preference = nil,
      },
      icons = {
        File = "󰈙 ",
        Module = " ",
        Namespace = "󰌗 ",
        Package = " ",
        Class = "󰌗 ",
        Method = "󰆧 ",
        Property = " ",
        Field = " ",
        Constructor = " ",
        Enum = "󰕘",
        Interface = "󰕘",
        Function = "󰊕 ",
        Variable = "󰆧 ",
        Constant = "󰏿 ",
        String = "󰀬 ",
        Number = "󰎠 ",
        Boolean = "◩ ",
        Array = "󰅪 ",
        Object = "󰅩 ",
        Key = "󰌋 ",
        Null = "󰟢 ",
        EnumMember = " ",
        Struct = "󰌗 ",
        Event = " ",
        Operator = "󰆕 ",
        TypeParameter = "󰊄 ",
      },
    },
  }

}
