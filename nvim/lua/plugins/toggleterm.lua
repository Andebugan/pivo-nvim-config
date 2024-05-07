return {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
        require('toggleterm').setup()

        vim.keymap.set('n', '<leader>tt', '<cmd>ToggleTerm<cr>', {})
        vim.keymap.set('n', '<leader>tm', '<cmd>ToggleTerm name=main<cr>', {})
        vim.keymap.set('n', '<leader>tg', '<cmd>ToggleTerm name=git<cr>', {})
        vim.keymap.set('n', '<leader>ts', '<cmd>TermSelect<cr>', {})

        local trim_spaces = true
        vim.keymap.set("v", "<space>s", function()
        end)
        require("toggleterm").send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
        -- For use as an operator map:
        -- Send motion to terminal
        vim.keymap.set("n", [[<leader><c-\>]], function()
            set_opfunc(function(motion_type)
                require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
            end)
            vim.api.nvim_feedkeys("g@", "n", false)
        end)
        -- Double the command to send line to terminal
        vim.keymap.set("n", [[<leader><c-\><c-\>]], function()
            set_opfunc(function(motion_type)
                require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
            end)
            vim.api.nvim_feedkeys("g@_", "n", false)
        end)
        -- Send whole file
        vim.keymap.set("n", [[<leader><leader><c-\>]], function()
            set_opfunc(function(motion_type)
                require("toggleterm").send_lines_to_terminal(motion_type, false, { args = vim.v.count })
            end)
            vim.api.nvim_feedkeys("ggg@G''", "n", false)
        end)

        function _G.set_terminal_keymaps()
            local opts = {buffer = 0}
            vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
            vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
            vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
            vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
            vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
            vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
        end
    end
}
