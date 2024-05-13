return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        config = function()
            require("mason").setup()

            local packages = {
            }

            -- custom config add packages
            local config = require("plugins.config.config")

            if config.python then table.insert(packages, "debugpy") end

            require("mason-nvim-dap").setup({
                ensure_installed = packages,
                automatic_installation = true
            })
        end
    },
    {
        "mfussenegger/nvim-dap",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "williamboman/mason.nvim",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap, dapui = require('dap'), require('dapui')
            dapui.setup()

            -- Python debugger config
            if LANG_INSTALL_CONFIG.python then
                dap.adapters.python = function(cb, config)
                    if config.request == 'attach' then
                        --@diagnostic disable-next-line: undefined-field
                        local port = (config.connect or config).port
                        --@diagnostic disable-next-line: undefined-field
                        local host = (config.connect or config).host or '127.0.0.1'
                        cb({
                            type = 'server',
                            port = assert(port, '`connect.port` is required for a python `attach` configuration'),
                            host = host,
                            options = {
                                source_filetype = 'python',
                            },
                        })
                    else
                        cb({
                            type = 'executable',
                            command = '~/.virtualenvs/debugpy/bin/python',
                            args = { '-m', 'debugpy.adapter' },
                            options = {
                                source_filetype = 'python'
                            },
                        })
                    end

                    dap.configurations.python = {
                        type = 'python';
                        request = 'launch';
                        name = "Launch file";

                        program = "${file}";

                        pythonPath = function ()
                            local cwd = vim.fn.getcwd()
                            if vim.fn.executable(cwd .. '/venv/bin/python') == 1 then
                                return cwd .. '/venv/bin/python'
                            elseif vim.fn.executable(cwd .. '/.venv/bin/python') == 1 then
                                return cwd .. '/.venv/bin/pyhon'
                            else
                                return '/usr/bin/python'
                            end
                        end;
                    }
                end
            end

            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open()
            end

            dap.listeners.after.event_terminated['dapui_config'] = function()
                dapui.close()
            end

            dap.listeners.after.event_exited['dapui_config'] = function()
                dapui.close()
            end

            vim.keymap.set('n', '<leader>db', ':DapToggleBreakpoint<CR>')
            vim.keymap.set('n', '<leader>dt', ':DapTerminate<CR>')
            vim.keymap.set('n', '<leader>dc', ':DapContinue<CR>')
            vim.keymap.set('n', '<leader>do', ':DapStepOver<CR>')
        end
    },
}
