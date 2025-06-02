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

-- Auto-store yanked text in register 'a' and Paste from register 'a'
vim.api.nvim_create_autocmd("TextYankPost", {
    pattern = "*",
    callback = function()
        if vim.v.event.operator == "y" then
            vim.fn.setreg("a", vim.fn.getreg("\""))
        end
    end
})
vim.keymap.set("n", "<leader>p", '"ap', opts)


vim.keymap.set("n", "<leader>tn", ':tabnew<CR>', opts)
vim.keymap.set("n", "<leader>tc", ':tabclose<CR>', opts)
vim.keymap.set("t", "<C-[>", '<C-\\><C-n>', opts)
