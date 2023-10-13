-- git clone --depth 1 https://github.com/wbthomason/packer.nvim\
-- ~/.local/share/nvim/site/pack/packer/start/packer.nvim

--vim-plug to install plugins
require('packer').startup(function(use)
    use 'wbthomason/packer.nvim' -- plugin manager

    use 'windwp/nvim-autopairs' -- closes opening brackets and quotes

    use 'nvim-treesitter/nvim-treesitter' --  improves syntax highlighting

    use 'neovim/nvim-lspconfig' -- adds lsp support
    use "williamboman/mason.nvim" -- "package manager" for language servers
    use 'williamboman/mason-lspconfig.nvim' -- improves support for mason lspconfig
    use 'numToStr/Comment.nvim' -- allows for commenting vs gc and gcc

    use {"ellisonleao/gruvbox.nvim"} -- gruvbox theme

    -- fuzzy finder
    use {
      'nvim-telescope/telescope.nvim', tag = '0.1.4',
      requires = { {'nvim-lua/plenary.nvim'} }
}


end)


-- Dvorak remap

-- vim.keymap.set("", "h", "h")
-- vim.keymap.set("", "t", "j")
-- vim.keymap.set("", "n", "k")
-- vim.keymap.set("", "N", "k")
-- vim.keymap.set("", "s", "l")
-- vim.keymap.set("", "S", "L")
-- vim.keymap.set("", "-", "$")
-- vim.keymap.set("", "l", "s")
-- vim.keymap.set("", "L", "S")
-- vim.keymap.set("", "T", "J")
-- vim.keymap.set("", "k", 'n')
-- vim.keymap.set("", "K", 'N')
-- vim.keymap.set("", "j", "t")
-- vim.keymap.set("", "J", "T")

-- map("", "<enter>", "o<esc>")

-- Options
vim.o.number = true -- show line numbers
vim.o.scl = 'yes' -- hide/show sign collumn
vim.o.relativenumber = true -- show relative line numbers
vim.o.tabstop = 4 -- number of columns occupied by a tab
vim.o.softtabstop = 4 -- see multiple spaces as tabstops
vim.o.expandtab = true -- converts tabs to white space
vim.o.shiftwidth = 4 -- sets width for autoindent
vim.o.ttyfast = true -- increases scrolling speed
vim.o.autoindent = true -- indent new lines the same amount as previous line
-- vim.cmd[[set clipboard=unnamedplus]] -- use system clipboard
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

-- REMAPS --
vim.g.mapleader = ' '

vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

-- move selected text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]]) -- doen't copy replaced word to clipboard when paste-replacing

-- use system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- find and replace currrent word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])



require('nvim-treesitter.configs').setup {
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    -- indent = {
    --     enable = true
    -- }
}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})


require('nvim-autopairs').setup()


-- use gcc to comment in normal mode and gc in visual mode
require('Comment').setup()

require('mason').setup {}
require('mason-lspconfig').setup()

local lspconfig = require('lspconfig')
lspconfig.rust_analyzer.setup {
  -- Server-specific settings. See `:help lspconfig-setup`
  settings = {
    ['rust-analyzer'] = {},
  },
}
-- lspconfig.lua_ls.setup {}


-- LSP SETUP

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts) -- goes to declaration
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts) -- goes to definition
    vim.keymap.set('n', 'N', vim.lsp.buf.hover, opts) -- displays variable/function info
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts) -- rename function or variable
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})
