local set = vim.keymap.set
local k = vim.keycode

set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

set("n", "<space>tt", function()
  vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }), { bufnr = 0 })
end)

-- Key mappings
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Move selected lines in visual mode
set("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
set("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)

-- Center search movements
set("n", "<C-u>", "<C-u>zz", opts)
set("n", "<C-d>", "<C-d>zz", opts)
set("n", "n", "nzzzv", opts)

-- Toggle spellcheck
set("n", "<C-l>", ":setlocal spell! spell?<CR>", opts)
set("i", "<C-l>", "<C-o>:setlocal spell! spell?<CR>", opts)

-- Toggle search highlight

set("n", "<CR>", function()
  if vim.v.hlsearch == 1 then
    vim.cmd.nohl()
    return ""
  else
    return k("<CR>")
  end
end, { expr = true })
-- using system clipboard
set({ "n", "v", "x" }, "<leader>p", '"+p', opts)
set({ "n", "v", "x" }, "<leader>y", '"+y', opts)

set("n", "<leader>tn", ":tabnew<CR>", opts)
set("n", "<leader>tc", ":tabclose<CR>", opts)
set("t", "<C-[>", "<C-\\><C-n>", opts)
