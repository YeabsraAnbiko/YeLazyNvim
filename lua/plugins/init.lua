local plugin_files = {
    "colorscheme",
    "lualine",
    "autotag-autopairs",
    "git_and_undo",
    "lsp-cmp-mason",
    "telescope",
    "dap",
    "tmux",
    "neo-tree",
    "indent-blinkline",
    "colorizer",
}

local plugins = {}
for _, file in ipairs(plugin_files) do
  vim.list_extend(plugins, require("plugins." .. file))
end

return plugins

