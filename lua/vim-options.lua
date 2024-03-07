vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.g.mapleader = " "

-- tab keymaps
vim.keymap.set('n', '<Leader>tn', '<cmd>tabnew<cr>')  -- tab open
vim.keymap.set('n', '<Leader>tc', '<cmd>clo<cr>')     -- tab close

vim.keymap.set('n', '<Leader>t]', '<cmd>tabnext<cr>') -- tab next
vim.keymap.set('n', '<Leader>t[', '<cmd>tabprev<cr>') -- tab prev

vim.cmd("set encoding=utf-8")

-- ctrl-c ctrl-v for windows registers
vim.keymap.set('n', '<Leader>cc', '<cmd>"*y<cr>')
vim.keymap.set('n', '<Leader>cv', '<cmd>"*p<cr>')
