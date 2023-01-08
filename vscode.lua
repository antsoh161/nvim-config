local keymap = vim.keymap.set
local opts = { silent = true }

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "


keymap("n", "<leader>s", ":w<CR>", opts)
vim.opt.expandtab = true
vim.opt.tabstop = 5
