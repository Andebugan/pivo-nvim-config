-- basic settings
vim.o.number = true		-- enable line numbers
vim.o.relativenumber = false	-- enable relative line numbers
vim.o.tabstop = 4		-- number of spaces a tab represents
vim.o.shiftwidth = 4		-- number of spaces in each identations
vim.o.expandtab = true		-- convert tabs to spaces
vim.o.smartindent = true	-- automatically indent new lines
vim.o.wrap = true		-- disable line wrapping
vim.o.termguicolors = true	-- enable 24-bit RGB colors

-- key mappings
vim.g.mapleader = ' ' 		-- set space as the leader key

-- syntax
vim.cmd('syntax enable')	-- enable syntax highlight
