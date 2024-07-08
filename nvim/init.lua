vim.g.mapleader = " "
require("keymaps")

-- Options
vim.o.number = true -- show line numbers
vim.o.relativenumber = true -- show relative line numbers
vim.o.scl = "no" -- hide/show sign collumn

vim.opt.colorcolumn = "80"

vim.o.tabstop = 4 -- width of a tab
vim.o.softtabstop = 4 -- treat multiple spaces as tabs
vim.o.expandtab = true -- convert tabs to spaces
vim.o.shiftwidth = 4 -- set width for autoindent
vim.o.autoindent = true

vim.o.ttyfast = true -- increases scrolling speed
vim.o.cursorline = true -- highlight current line
vim.o.updatetime = 250

-- stops highlighting after search is complete
vim.o.hlsearch = false
vim.o.incsearch = true

vim.o.scrolloff = 5 -- starts scrolling ten lines before bottom or top
vim.o.swapfile = false
vim.termguicolors = true -- 256 color support
vim.o.clipboard = "unnamedplus" -- use system clipboard
vim.cmd[[colorscheme gruvbox]]

-- -- disables autocommenting on new lines
-- vim.api.nvim_create_autocmd("BufEnter", {
--     callback = function() vim.opt.formatoptions = vim.opt.formatoptions - {
--         "c","r","o" 
--     } end, 
-- })

