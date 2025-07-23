return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      indent = {
        char = "┊",
      },
      scope = {
        enabled = true,
      },
      exclude = {
        filetypes = {
          "help", "dashboard", "packer", "neogitstatus", "NvimTree", "Trouble", "lazy", "mason",
        },
      },
    },
  },
}

