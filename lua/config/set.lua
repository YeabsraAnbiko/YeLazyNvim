-- Indentation settings
vim.opt.showcmd = true
vim.opt.showmode = true
vim.opt.tabstop = 4 -- Number of spaces a tab counts for
vim.opt.softtabstop = 4 -- Number of spaces to insert when using the backspace key
vim.opt.shiftwidth = 4 -- Number of spaces for each level of indentation
vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.autoindent = true -- Copy indent from current line
vim.opt.smartindent = true -- Enable smart indentation for better formatting

vim.opt.shortmess:append("I")
vim.opt.laststatus = 3
-- vim.o.winbar="%=%m 📁%f"
-- vim.opt.statusline = " %f %m %= %l:%c ♥ "
-- Cursor appearance
--vim.opt.guicursor = ""       -- Reset cursor appearance

-- Line numbers
vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.cursorline = true -- Highlight the current line

-- Wrapping settings
vim.opt.wrap = false -- Disable line wrapping

-- File management settings
vim.opt.backup = false
vim.opt.swapfile = false

vim.opt.undofile = true -- Enable persistent undo files

-- Search settings
vim.opt.hlsearch = false -- Disable search result highlighting
vim.opt.incsearch = true -- Enable incremental search
vim.opt.ignorecase = true -- Ignore case in search
vim.opt.smartcase = true -- Override ignorecase if uppercase letters are used

-- Visual enhancements
vim.opt.termguicolors = true -- Enable 24-bit RGB colors
vim.opt.updatetime = 100
vim.opt.scrolloff = 8 -- Keep 8 lines visible above/below the cursor
vim.opt.sidescrolloff = 8 -- Keep 8 columns visible left/right
vim.opt.signcolumn = "yes" -- Always show the sign column
vim.opt.colorcolumn = "80" -- Show a vertical line at the 80th character

vim.opt.splitbelow = true -- Open horizontal splits below
vim.opt.splitright = true -- Open vertical splits to the right

-- Mouse support
vim.opt.mouse = "a" -- Enable mouse support

-- Fold settings
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'v:lua.vim.lsp.foldexpr()'
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
-- Default to treesitter folding
-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
--
-- -- Switch to LSP folding when an LSP server attaches that supports it
-- vim.api.nvim_create_autocmd('LspAttach', {
--   callback = function(args)
--     local client = vim.lsp.get_client_by_id(args.data.client_id)
--     if client and client.supports_method('textDocument/foldingRange') then
--       vim.wo.foldexpr = 'v:lua.vim.lsp.foldexpr()'
--     end
--   end,
-- })



vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.diagnostic.config({
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "󰌵",
    },
  },
})

function Bgvis()
  vim.cmd([[
  hi Normal guibg=NONE ctermbg=NONE
  hi NonText guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi LineNr guibg=NONE ctermbg=NONE
  hi Folded guibg=NONE ctermbg=NONE
  hi EndOfBuffer guibg=NONE ctermbg=NONE
  hi NormalFloat guibg=NONE
  hi FloatBorder guibg=NONE
]])
end

vim.opt.list = true
