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

-- unrelated to treesitter
require("nvim-autopairs").setup()

-- unrelated to treesitter
-- help: use gcc to comment in normal mode and gc in visual mode
require("Comment").setup()
