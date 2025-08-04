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
    end,
    keys = {
      { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle Breakpoint" },
      { "<leader>dc", "<cmd>DapContinue<cr>",         desc = "Continue" },
      { "<leader>di", "<cmd>DapStepInto<cr>",         desc = "Step Into" },
      { "<leader>do", "<cmd>DapStepOver<cr>",         desc = "Step Over" },
      { "<leader>du", "<cmd>DapStepOut<cr>",          desc = "Step Out" },
      { "<leader>dr", "<cmd>DapReplOpen<cr>",         desc = "Open REPL" },
      { "<leader>dt", "<cmd>DapTerminate<cr>",        desc = "Terminate Debugger" },
    },
  },
}
