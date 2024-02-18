vim.g.mapleader = " "
require("keymaps")

-- Options
vim.o.number = true -- show line numbers
vim.o.relativenumber = true -- show relative line numbers
vim.o.scl = "no" -- hide/show sign collumn

vim.opt.colorcolumn = "80"

vim.o.tabstop = 4 -- number of columns occupied by a tab
vim.o.softtabstop = 4 -- see multiple spaces as tabstops
vim.o.expandtab = true -- converts tabs to white space
vim.o.shiftwidth = 4 -- sets width for autoindent
vim.o.autoindent = true -- indent new lines the same amount as previous line

vim.o.ttyfast = true -- increases scrolling speed
vim.o.cursorline = true -- highlight current line
vim.o.updatetime = 250
vim.o.syntax = false -- disable regex syntax (treesitter insstead)

-- stops highlighting after search is complete
vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.scrolloff = 5 -- starts scrolling ten lines before bottom or top
vim.o.swapfile = false
vim.termguicolors = true -- 256 color support
vim.o.clipboard = "unnamedplus" -- use system clipboard
vim.cmd[[colorscheme gruvbox]]

-- disables autocommenting on new lines
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function() vim.opt.formatoptions = vim.opt.formatoptions - {
        "c","r","o" 
    } end, 
})

