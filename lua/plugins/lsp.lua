return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      -- Global LSP keymaps
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to Definition" })
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to Declaration" })
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
      vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Info" })
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev Diagnostic" })
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next Diagnostic" })
      vim.keymap.set("n", "<leader>di", vim.diagnostic.open_float, { desc = "Diagnostic Info" })
      vim.keymap.set("n", "<leader>fd", vim.lsp.buf.format, { desc = "Format Document" })

      -- Toggle virtual text diagnostics
      local virtual_text_enabled = true
      vim.keymap.set("n", "<leader>vt", function()
        virtual_text_enabled = not virtual_text_enabled
        vim.diagnostic.config({ virtual_text = virtual_text_enabled })
        print("Diagnostics virtual text " .. (virtual_text_enabled and "enabled" or "disabled"))
      end, { desc = "Toggle Diagnostics Virtual Text" })

      -- Diagnostics config
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
}

