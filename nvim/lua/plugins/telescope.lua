return {
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
    }
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.6', 
        dependencies = {
            'nvim-lua/plenary.nvim'
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-ui-select.nvim'
        },
        config = function()
            cal builtin = require("telescope.builtin")
            vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
            vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
            vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
            vim.keymap.set('n', '<leader>fh', builtin.oldfiles, {})
            vim.keymap.set('n', '<leader>fp', ':Telescope projects<CR>', {})
            vim.keymap.set('n', '<leader>pr', ':ProjectRoot<CR>', {})
            require('telescope').setup {
                file_ignore_patterns = {
                    "node_modules/.*",
                    ".git/.*",
                    "tmp/.*",
                    "cahce/.*"
                },
                extensions = {
                    fzf = {
                        fuzzy = true,
                        override_generic_sorter = true,
                        override_file_sorter = true,
                        case_mode = "smart_case",
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {}
                    }
                }
            }

            require('telescope').load_extension('fzf')
            require('telescope').load_extension('ui-select')
            require('telescope').load_extension('project')
        end
    },
}
