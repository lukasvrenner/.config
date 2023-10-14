
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
