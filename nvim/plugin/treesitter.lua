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

-- -- unrelated to treesitter
-- require("nvim-autopairs").setup()
