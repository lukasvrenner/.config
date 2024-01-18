
-- REMAPS --
-- vim.g.mapleader = ' '

vim.keymap.set("n", "<leader>n", vim.cmd.Ex)

-- move selected text up or down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", [["_dP]]) -- doen't copy replaced word to clipboard when paste-replacing

-- find and replace currrent word
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- use esc to enter normal mode in terminal
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")
-- vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])
