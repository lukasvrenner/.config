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

-- git clone --depth=1 https://github.com/savq/paq-nvim.git \
--     "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/pack/paqs/start/paq-nvim
require("paq") {
    "savq/paq-nvim",
    "windwp/nvim-autopairs", -- auto closing-pairs

    "neovim/nvim-lspconfig", -- adds lsp support

    "nvim-treesitter/nvim-treesitter", -- improves syntax highlighting
    "hrsh7th/cmp-nvim-lsp", -- lsp completion
    "hrsh7th/cmp-buffer", -- buffer completion
    "hrsh7th/cmp-path", -- path completion
    "hrsh7th/nvim-cmp", -- completion engine
    "L3MON4D3/LuaSnip", -- snippet engine
    "saadparwaiz1/cmp_luasnip", -- snippet completion
    "numToStr/Comment.nvim", -- allows for commenting vs gc and gcc
    "ellisonleao/gruvbox.nvim", -- gruvbox theme
    -- fuzzy finder
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- commonly used functions
}

require("nvim-autopairs").setup()

-- use gcc to comment in normal mode and gc in visual mode
require("Comment").setup()
