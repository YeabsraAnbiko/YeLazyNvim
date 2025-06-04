return {
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
            "mason-org/mason.nvim",
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")

            -- Mason + DAP installer
            require("mason").setup()
            require("mason-nvim-dap").setup({
                automatic_setup = true,
                handlers = {}, -- uses default handlers
            })

            -- UI and virtual text
            dapui.setup()
            require("nvim-dap-virtual-text").setup()

            -- Auto open/close dapui
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
            vim.keymap.set('n', '<Leader>dc', function() dap.continue() end)
            vim.keymap.set('n', '<Leader>so', function() dap.step_over() end)
            vim.keymap.set('n', '<Leader>si', function() dap.step_into() end)
            vim.keymap.set('n', '<Leader>sO', function() dap.step_out() end)
            vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end)
            vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)


            dap.adapters["local-lua"] = {
                type = "executable",
                command = "node",
                args = {
                    vim.fn.stdpath("data") .. "/mason/packages/local-lua-debugger-vscode/extension/debugAdapter.js"
                },
            }

            dap.configurations.lua = {
                {
                    type = "local-lua",
                    request = "launch",
                    name = "Launch Lua file",
                    program = function()
                        return vim.fn.input('Path to Lua file: ', vim.fn.getcwd() .. '/', 'file')
                    end,
                    cwd = "${workspaceFolder}",
                    stopOnEntry = true,
                    args = {},
                },
            }

        end
    },


}

