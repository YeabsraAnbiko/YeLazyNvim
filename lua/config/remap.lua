-- Key mappings
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- Move selected lines in visual mode
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", opts)

-- Center search movements
vim.keymap.set("n", "<C-u>", "<C-u>zz", opts)
vim.keymap.set("n", "<C-d>", "<C-d>zz", opts)
vim.keymap.set("n", "n", "nzzzv", opts)

-- Toggle spellcheck
vim.keymap.set("n", "<C-l>", ":setlocal spell! spell?<CR>", opts)
vim.keymap.set("i", "<C-l>", "<C-o>:setlocal spell! spell?<CR>", opts)

-- Toggle search highlight
vim.keymap.set("n", "<leader>/", ":set hlsearch!<CR>", opts)

-- using system clipboard
vim.keymap.set({'n', 'v', 'x'}, "<leader>p", '"+p', opts)
vim.keymap.set({'n', 'v', 'x'}, "<leader>y", '"+y', opts)

vim.keymap.set("n", "<leader>tn", ':tabnew<CR>', opts)
vim.keymap.set("n", "<leader>tc", ':tabclose<CR>', opts)
vim.keymap.set("t", "<C-[>", '<C-\\><C-n>', opts)
