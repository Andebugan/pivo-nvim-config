return {
  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
      }
    end
  },
  {
    'rmagatti/session-lens',
    requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
    config = function()
      require('session-lens').setup({})

      vim.keymap.set('n', '<leader>sl', ':SearchSession<CR>', {})
      vim.keymap.set('n', '<leader>sd', ':SessionDelete<CR>', {})
      vim.keymap.set('n', '<leader>ss', ':SessionSave<CR>', {})

    end
  }
}
