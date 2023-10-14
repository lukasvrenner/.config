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
