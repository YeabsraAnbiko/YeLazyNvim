-- netrw configuration
vim.g.netrw_liststyle = 3       -- Use tree view
vim.g.netrw_banner = 0          -- Hide the banner

--Hidden files sequence
vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\.\S\+]]

--vim.g.netrw_list_hide = [[\(^\|\s\s\)\zs\(\.git\|\.DS_Store\|node_modules\|__pycache__\|\.cache\|\.vscode\|.*\.o\|.*\.class\|\.\S\+\)$]]
vim.keymap.set("n", "<leader>n", vim.cmd.Ex)
