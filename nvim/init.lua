-- it clone --depth 1 https://github.com/wbthomason/packer.nvim\
-- ~/.local/share/nvim/site/pack/packer/start/packer.nvim

-- vim-plug to install plugins
require('packer').startup(function(use)

    use 'wbthomason/packer.nvim'

    use 'lukas-reineke/indent-blankline.nvim' -- adds indent-lines in blank lines


    use 'windwp/nvim-autopairs'

    use 'nvim-treesitter/nvim-treesitter'

    -- use 'neovim/nvim-lspconfig'
    -- use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    -- use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    --
    -- use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    -- use 'L3MON4D3/LuaSnip' -- Snippets plugin
    --
    -- use {
    --     "williamboman/mason.nvim",
    --     run = ":MasonUpdate" -- :MasonUpdate updates registry contents
    -- }
    -- use 'williamboman/mason-lspconfig.nvim'
    --
    use 'numToStr/Comment.nvim'
    use { "ellisonleao/gruvbox.nvim" } -- gruvbox theme


end)

-- Functional wrapper for mapping custom keybindings
	function map(mode, lhs, rhs, opts)
		local options = { noremap = true }
		if opts then
			options = vim.tbl_extend("force", options, opts)
		end
		vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Dvorak remap

map("", "h", "h")
map("", "t", "j")
map("", "n", "k")
map("", "N", "k")
map("", "s", "l")
map("", "S", "L")
map("", "-", "$")
map("", "l", "s")
map("", "L", "S")
map("", "T", "J")


-- replaces n with k for next result
map("", "k", 'n')
map("", "K", 'N')

map("", "j", "t")
map("", "J", "T")

vim.g.mapleader = '<space>'
-- map("", "<enter>", "o<esc>")

-- Options
vim.o.number = true -- show line numbers
vim.o.scl = 'no'
vim.o.relativenumber = true -- show relative line numbers
vim.o.tabstop = 4 -- number of columns occupied by a tab
vim.o.softtabstop = 4 -- see multiple spaces as tabstops
vim.o.expandtab = true -- converts tabs to white space
vim.o.shiftwidth = 4 -- sets width for autoindent
vim.o.ttyfast = true -- increases scrolling speed in tty
vim.o.autoindent = true -- indent new lines the same amount as previous line
vim.cmd[[set clipboard=unnamedplus]] -- use system clipboard
vim.cmd[[set hls!]]
vim.o.cursorline = true -- highlight current line
vim.cmd[[autocmd FileType * set formatoptions-=ro]] -- disables autocommenting on new lines
vim.o.updatetime = 250
vim.o.ignorecase = true -- case insensitive search
-- vim.o.scrolloff = 5 -- starts scrolling ten lines before bottom or top

-- disable semantic highlighting
-- needs to be put in a ColorScheme autocommand to work
for _, group in ipairs(vim.fn.getcompletion("@lsp", "highlight")) do
    vim.api.nvim_set_hl(0, group, {})
end

vim.cmd[[colorscheme gruvbox]]

require('nvim-autopairs').setup()


-- use gcc to comment in normal mode and gc in visual mode
require('Comment').setup()

-- require('mason').setup {}
-- require('mason-lspconfig').setup()
--
-- -- Add nvim-lspconfig plugin
-- local lspconfig = require 'lspconfig'
-- local on_attach = function(_, bufnr)
--   local attach_opts = { silent = true, buffer = bufnr }
--   vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, attach_opts)
--   vim.keymap.set('n', 'gd', vim.lsp.buf.definition, attach_opts)
--   vim.keymap.set('n', 'N', vim.lsp.buf.hover, attach_opts)
--   vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, attach_opts)
--   vim.keymap.set('n', '<C-s>', vim.lsp.buf.signature_help, attach_opts)
--   vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, attach_opts)
--   vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, attach_opts)
--   vim.keymap.set('n', '<leader>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, attach_opts)
--   vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, attach_opts)
--   vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, attach_opts)
--   -- vim.keymap.set('n', 'so', require('telescope.builtin').lsp_references, attach_opts)
-- end
--
-- -- nvim-cmp supports additional completion capabilities
-- -- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- -- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)
--
-- -- Enable the following language servers
-- local servers = {'rust_analyzer'}
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end
--
-- lspconfig.lua_ls.setup {
--   on_attach = on_attach,
--   capabilities = capabilities,
--   settings = {
--     Lua = {
--       completion = {
--         callSnippet = 'Replace',
--       },
--     },
--   },
-- }
--
--
-- -- nvim-cmp setup
-- local cmp = require 'cmp'
-- local luasnip = require 'luasnip'
--
-- luasnip.config.setup {}
--
-- cmp.setup {
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   mapping = cmp.mapping.preset.insert {
--     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete {},
--     ['<CR>'] = cmp.mapping.confirm {
--       behavior = cmp.ConfirmBehavior.Replace,
--       select = true,
--     },
--     ['<Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--     ['<S-Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--   },
--   sources = {
--     { name = 'nvim_lsp' },
--     { name = 'luasnip' },
--   },
-- }

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

