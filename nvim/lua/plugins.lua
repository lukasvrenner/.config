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

