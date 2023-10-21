vim.g.mapleader = ' '
-- require('plugins')
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
vim.o.syntax = false
-- stops highlighting after search is complete
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- vim.o.scrolloff = 5 -- starts scrolling ten lines before bottom or top
vim.cmd[[colorscheme gruvbox]]
vim.opt.swapfile = false
vim.termguicolors = true

-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
-- ~/.local/share/nvim/site/pack/packer/start/packer.nvim

require('packer').startup(function(use)
	use 'wbthomason/packer.nvim' -- plugin manager

	use 'windwp/nvim-autopairs' -- closes opening brackets and quotes

	use 'nvim-treesitter/nvim-treesitter' --  improves syntax highlighting

	use 'neovim/nvim-lspconfig' -- adds lsp support
	use "williamboman/mason.nvim" -- "package manager" for language servers
	use 'williamboman/mason-lspconfig.nvim' -- improves support for mason lspconfig

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/nvim-cmp'
    use 'L3MON4D3/LuaSnip'
    use 'saadparwaiz1/cmp_luasnip'

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
