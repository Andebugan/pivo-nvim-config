return {
  {
    "jay-babu/mason-nvim-dap.nvim",
    config = function()
      require("mason").setup()
      require("mason-nvim-dap").setup()
    end
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "williamboman/mason.nvim"
    },
    config = function()
      local dap, dapui = require('dap'), require('dapui')
      dapui.setup()

      local mason_registry = require("mason-registry")

      -- csharp

      local netcoredbg = mason_registry.get_package("netcoredbg")
      dap.adapters.coreclr = {
        type = 'executable',
        command = netcoredbg:get_install_path() .. "/netcoredbg",
        args = { '--interpreter=vscode' }
      }

      dap.configurations.cs = {
        {
          type = "coreclr",
          name = "launch - netcoredbg",
          request = "launch",
          program = function()
            return vim.fn.input('Path to dll:', vim.fn.getcwd() .. '/bin/Debug/', 'file')
          end,
        },
      }

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
  }
}
