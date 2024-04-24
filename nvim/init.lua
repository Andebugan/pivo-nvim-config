-- basic settings
vim.o.number = true             -- enable line numbers
vim.o.ruler = false             -- disable ruler
vim.o.relativenumber = false    -- enable relative line numbers

vim.o.tabstop = 4               -- number of spaces a tab represents
vim.o.shiftwidth = 4            -- number of spaces in each identations
vim.o.expandtab = true          -- convert tabs to spaces
vim.o.smartindent = true        -- automatically indent new lines
vim.o.wrap = true               -- disable line wrapping
vim.o.linebreak = true          -- enable breaking at words for wrap option

vim.o.termguicolors = false     -- disnable 24-bit RGB colors

vim.o.ignorecase = true         -- set ignore case for search
vim.o.smartcase = true          -- set smart case for search

vim.o.foldmethod = "indent"       -- set fold of folding to indent

-- key mappings
vim.g.mapleader = ' '           -- set space as the leader key

-- tab keymaps
vim.keymap.set('n', '<Leader>tc', '<cmd>tabnew<cr>')    -- open new tab
vim.keymap.set('n', '<Leader>tx', '<cmd>tabclose<cr>')  -- close tab
vim.keymap.set('n', '<Leader>tn', '<cmd>tabnext<cr>')   -- next tab
vim.keymap.set('n', '<Leader>tp', '<cmd>tabprev<cr>')   -- previous tab
vim.keymap.set('n', '<Leader>tf', '<cmd>tabfirst<cr>')  -- first tab
vim.keymap.set('n', '<Leader>tl', '<cmd>tablast<cr>')   -- last tab

-- syntax
vim.cmd('syntax enable')	            -- enable syntax highlight
vim.cmd('filetype plugin indent on')    -- enable filetype detection, completions, plugin files and indent files
