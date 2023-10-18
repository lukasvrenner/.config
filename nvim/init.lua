vim.g.mapleader = ' '
require('plugins')
require('keymaps')

-- Options
vim.o.number = true -- show line numbers
vim.o.scl = 'no' -- hide/show sign collumn
vim.o.relativenumber = true -- show relative line numbers
vim.o.tabstop = 4 -- number of columns occupied by a tab
vim.o.softtabstop = 4 -- see multiple spaces as tabstops
vim.o.expandtab = true -- converts tabs to white space
vim.o.shiftwidth = 4 -- sets width for autoindent
vim.o.ttyfast = true -- increases scrolling speed
vim.o.autoindent = true -- indent new lines the same amount as previous line
vim.cmd[[set clipboard=unnamedplus]] -- use system clipboard
vim.o.cursorline = true -- highlight current line
vim.cmd[[autocmd FileType * set formatoptions-=ro]] -- disables autocommenting on new lines
vim.o.updatetime = 250
vim.o.ignorecase = true -- case insensitive search
-- stops highlighting after search is complete
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- vim.o.scrolloff = 5 -- starts scrolling ten lines before bottom or top
vim.cmd[[colorscheme gruvbox]]
vim.opt.swapfile = false
vim.termguicolors = true
