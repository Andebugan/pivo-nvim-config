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

      -- C/C++
      local codelldb = mason_registry.get_package("codelldb")
      dap.adapters.codelldb = {
        type = 'server',
        port = "${port}",
        executable = {
          -- CHANGE THIS to your path!
          command = codelldb:get_install_path() .. "/codelldb",
          args = { "--port", "${port}" },

          -- On windows you may have to uncomment this:
          -- detached = false,
        }
      }


      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }      dap.listeners.after.event_initialized['dapui_config'] = function()
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
