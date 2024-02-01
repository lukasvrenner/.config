vim.g.mapleader = ' '
require('keymaps')

-- Options
vim.o.number = true -- show line numbers
vim.o.relativenumber = true -- show relative line numbers
vim.o.scl = 'no' -- hide/show sign collumn

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
vim.o.clipboard = 'unnamedplus' -- use system clipboard
vim.cmd[[colorscheme gruvbox]]

-- disables autocommenting on new lines
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function() vim.opt.formatoptions = vim.opt.formatoptions - {
        "c","r","o" 
    } end, 
})

-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
-- ~/.local/share/nvim/site/pack/packer/start/packer.nvim

-- PACKER IS NO LONGER MAINTAINED
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- plugin manager

	use 'windwp/nvim-autopairs' -- closes opening brackets and quotes

	use 'nvim-treesitter/nvim-treesitter' --  improves syntax highlighting

	use 'neovim/nvim-lspconfig' -- adds lsp support
	-- use "williamboman/mason.nvim" -- "package manager" for language servers
	-- use 'williamboman/mason-lspconfig.nvim' -- improves support for mason lspconfig

    use 'hrsh7th/cmp-nvim-lsp' -- lsp completion
    use 'hrsh7th/cmp-buffer' -- buffer completion
    use 'hrsh7th/cmp-path' -- path completion
    use 'hrsh7th/nvim-cmp' -- completion engine
    use 'L3MON4D3/LuaSnip' -- snippet engine
    use 'saadparwaiz1/cmp_luasnip' -- snippet completion

	use 'numToStr/Comment.nvim' -- allows for commenting vs gc and gcc

	use {"ellisonleao/gruvbox.nvim"} -- gruvbox theme

	-- fuzzy finder
	use {
	'nvim-telescope/telescope.nvim', tag = '0.1.4',
	requires = { {'nvim-lua/plenary.nvim'} }
	}


end)

require('nvim-autopairs').setup()

-- use gcc to comment in normal mode and gc in visual mode
require('Comment').setup()
