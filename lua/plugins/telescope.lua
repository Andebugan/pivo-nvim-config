return {
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup({
          patterns = {"_darcs", ".hg", ".bzr", ".svn", "package.json", ".sln", ".nvproj", "!Dockerfile", "!*.csproj", "!Program.cs"},
          show_hidden = true,
          scope_chdir = 'tab',
        })
      require("telescope").load_extension('projects')
    end
  },
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
      vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
      vim.keymap.set('n', '<leader>fh', builtin.oldfiles, {})
      vim.keymap.set('n', '<leader>fp', ':Telescope projects<CR>', {})
      vim.keymap.set('n', '<leader>pr', ':ProjectRoot<CR>', {})
      require('telescope').setup{
        file_ignore_patterns = {
          "node_modules/.*",
          ".git/.*",
          "tmp/.*",
          "cahce/.*"
        }
      }
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require('telescope').setup({
        extensions = {
          ["ui-select"] = {
            require('telescope.themes').get_dropdown {
            }
          }
        }
      })
      require('telescope').load_extension('ui-select')
    end
  }
}
