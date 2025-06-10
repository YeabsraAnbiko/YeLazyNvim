local plugin_files = {}

local plugins = {}
for _, file in ipairs(plugin_files) do
  vim.list_extend(plugins, require("plugins." .. file))
end

return plugins

