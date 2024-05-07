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

vim.o.termguicolors = true      -- disnable 24-bit RGB colors

vim.o.ignorecase = true         -- set ignore case for search
vim.o.smartcase = true          -- set smart case for search

vim.opt.fillchars = { eob = " "}-- disable tilde symbols after EOF

-- key mappings
vim.g.mapleader = ' '           -- set space as the leader key

-- tab keymaps
vim.keymap.set('n', '<Leader>to', '<cmd>tabnew<cr>')    -- open new tab
vim.keymap.set('n', '<Leader>tc', '<cmd>tabclose<cr>')  -- close tab
vim.keymap.set('n', '<Leader>tn', '<cmd>tabnext<cr>')   -- next tab
vim.keymap.set('n', '<Leader>tp', '<cmd>tabprev<cr>')   -- previous tab
vim.keymap.set('n', '<Leader>tf', '<cmd>tabfirst<cr>')  -- first tab
vim.keymap.set('n', '<Leader>tl', '<cmd>tablast<cr>')   -- last tab

-- file keymaps
vim.keymap.set('n', '<Leader>sf', '<cmd>w<cr>')         -- save current file
vim.keymap.set('n', '<Leader>sa', '<cmd>wa<cr>')        -- save all open files

-- cyrillic qwerty langmap
vim.o.langmap = "йq,цw,уe,кr,еt,нy,гu,шi,щo,зp,х[,ъ],фa,ыs,вd,аf,пg,рh,оj,лk,дl,ж\\;,э',яz,чx,сc,мv,иb,тn,ьm,б\\,,ю.,ё`,ЙQ,ЦW,УE,КR,ЕT,НY,ГU,ШI,ЩO,ЗP,Х{,Ъ},ФA,ЫS,ВD,АF,ПG,РH,ОJ,ЛK,ДL,Ж\\:,Э\",ЯZ,ЧX,СC,МV,ИB,ТN,ЬM,Б<,Ю>,Ё~"

-- syntax
vim.cmd('syntax enable')	            -- enable syntax highlight
vim.cmd('filetype plugin indent on')    -- enable filetype detection, completions, plugin files and indent files

-- terminal
vim.cmd('autocmd TermOpen * setlocal nonumber norelativenumber')    -- disable line numbers for terminal
vim.o.shell = "bash"                                                -- change terminal shell to bash

-- lazy.nvim setup
-- for correct symbol rendering Nerd Font should be installed (me have chosen Hack Mono you do you)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

