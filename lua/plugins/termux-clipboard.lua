-- ~/.config/nvim/lua/plugins/termux-clipboard.lua
-- Local plugin to integrate Termux clipboard with Neovim

return {
  -- Give Lazy.nvim a fake name but mark it as local
  "termux-clipboard-local",
  -- Prevent Lazy from trying to fetch or clone anything
  dir = vim.fn.stdpath("config") .. "/lua/plugins/",
  dev = true,
  lazy = false,
  config = function()
    -- Skip setup if termux-api is not available
    if vim.fn.executable('termux-clipboard-set') == 0 then
      vim.notify("⚠️ Termux clipboard commands not found. Skipping clipboard integration.", vim.log.levels.WARN)
      return
    end

    local function copy_to_clipboard()
      local start = vim.fn.getpos("'<")
      local finish = vim.fn.getpos("'>")
      local lines = vim.fn.getline(start[2], finish[2])
      lines[1] = string.sub(lines[1], start[3])
      lines[#lines] = string.sub(lines[#lines], 1, finish[3])
      local text = table.concat(lines, "\n")
      vim.fn.system({'termux-clipboard-set'}, text)
      vim.notify("✅ Copied to Android clipboard!")
    end

    local function paste_from_clipboard()
      local clip = vim.fn.system('termux-clipboard-get')
      if clip and #clip > 0 then
        vim.api.nvim_put({clip}, 'c', true, true)
      else
        vim.notify("⚠️ Clipboard empty or not accessible.")
      end
    end

    -- Key mappings
    vim.keymap.set('v', '<leader>y', copy_to_clipboard, { desc = 'Copy to Android clipboard' })
    vim.keymap.set('n', '<leader>p', paste_from_clipboard, { desc = 'Paste from Android clipboard' })

    -- Optional: make + register use Termux clipboard too
    vim.g.clipboard = {
      name = 'termux',
      copy = {
        ['+'] = 'termux-clipboard-set',
        ['*'] = 'termux-clipboard-set',
      },
      paste = {
        ['+'] = 'termux-clipboard-get',
        ['*'] = 'termux-clipboard-get',
      },
      cache_enabled = false,
    }
  end,
}
