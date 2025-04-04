local opts = { noremap = true, silent = true }

-- Leader key
vim.g.mapleader = " "

-- Basic keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, opts) -- open netrw
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts) -- move line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts) -- move line up
vim.keymap.set("n", "<leader>s", ":w<CR>", opts)    -- save file

-- Copy/paste/cut
vim.keymap.set("n", "<leader>y", '"+y', opts)
vim.keymap.set("v", "<leader>y", '"+y', opts)
vim.keymap.set("n", "<leader>d", '"+d', opts)
vim.keymap.set("v", "<leader>d", '"+d', opts)
vim.keymap.set("n", "<leader>p", '"+p', opts)
vim.keymap.set("v", "<leader>p", '"+p', opts)

-- Navigation (consider that < and > may need to be adapted)
vim.keymap.set("n", "<C-n>", ":tabn<CR>", opts)
vim.keymap.set("n", "<C-p>", ":tabp<CR>", opts)

-- Visual Block --
vim.keymap.set("v", "V", "^vg_", opts)


