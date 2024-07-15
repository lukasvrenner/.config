
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
    "ellisonleao/gruvbox.nvim", -- gruvbox theme
    -- fuzzy finder
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim", -- commonly used functions
}

