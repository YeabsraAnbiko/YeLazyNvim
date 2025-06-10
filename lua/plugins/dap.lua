return {
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "theHamsta/nvim-dap-virtual-text",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Setup mason and mason-nvim-dap
      require("mason").setup()

      require("mason-nvim-dap").setup({
        automatic_installation = true,
        automatic_setup = true,
        handlers = {}, -- auto-setup all default adapters
      })

      -- Setup dap-ui
      dapui.setup()

      -- Setup virtual text
      require("nvim-dap-virtual-text").setup()

      -- Auto open/close dap-ui
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Keymaps
      vim.keymap.set('n', '<Leader>dc', function() dap.continue() end, { desc = "DAP Continue" })
      vim.keymap.set('n', '<Leader>so', function() dap.step_over() end, { desc = "DAP Step Over" })
      vim.keymap.set('n', '<Leader>si', function() dap.step_into() end, { desc = "DAP Step Into" })
      vim.keymap.set('n', '<Leader>sO', function() dap.step_out() end, { desc = "DAP Step Out" })
      vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
      vim.keymap.set("n", "<leader>B", function()
        vim.ui.input({ prompt = "Breakpoint condition: " }, function(input)
          if input and input ~= "" then
            local ok, err = pcall(function()
              require("dap").set_breakpoint(input)
            end)
            if not ok then
              vim.notify("Invalid breakpoint condition: " .. err, vim.log.levels.ERROR)
            end
          else
            vim.notify("Breakpoint condition was empty, not set.", vim.log.levels.WARN)
          end
        end)
      end, { desc = "Set conditional breakpoint" })

    end,
  },
}

