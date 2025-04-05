
-- Leader key
vim.g.mapleader = " "
vim.g.locamaplleader = " "

-- Basic keymaps
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {noremap = true, silent = true, desc = "open netrw"})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv",  {noremap = true, silent = true, desc = "move line down"})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv",  {noremap = true, silent = true, desc = "move line up"})
vim.keymap.set("n", "<leader>s", ":w<CR>",  {noremap = true, silent = true, desc = "save file"})

-- Copy/paste/cut
vim.keymap.set("n", "<leader>y", '"+y',  {noremap = true, silent = true, desc = "copy on normal mode"})
vim.keymap.set("v", "<leader>y", '"+y',  {noremap = true, silent = true, desc = "copy on visual mode"})
vim.keymap.set("n", "<leader>d", '"+d',  {noremap = true, silent = true, desc = "cut on normal mode"})
vim.keymap.set("v", "<leader>d", '"+d',  {noremap = true, silent = true, desc = "cut on visual mode"})
vim.keymap.set("n", "<leader>p", '"+p',  {noremap = true, silent = true, desc = "paste on normal mode"})
vim.keymap.set("v", "<leader>p", '"+p',  {noremap = true, silent = true, desc = "paste on visual mode"})

-- Visual Block --
vim.keymap.set("v", "V", "^vg_",  {noremap = true, silent = true, desc = "mode Visual Block"})

-- Tabs
vim.keymap.set("n", "<C-t>", ":tabe<CR>", {noremap = true, silent = true, desc = "open tab page"})
vim.keymap.set("n", "<C-p>", ":-tabe<CR>", {noremap = true, silent = true, desc = "opens tabpage before the current"})
vim.keymap.set("n", "<C-n>", ":+tabe<CR>", {noremap = true, silent = true, desc = "tabpage after the next tab"})

vim.keymap.set("n", "<C-c>", ":tabc<CR>", {noremap = true, silent = true, desc = "close the current tab page"})
vim.keymap.set("n", "<C-z>", ":-tabc<CR>", {noremap = true, silent = true, desc = "close the previous tab page"})
vim.keymap.set("n", "<C-x>", ":+tabc<CR>", {noremap = true, silent = true, desc = "close the next tab page"})
vim.keymap.set("n", "<C-q>", ":tabo<CR>", {noremap = true, silent = true, desc = "close all tab pages except the current one"})

vim.keymap.set("n", "<C-Left>", ":-tabn<CR>", {noremap = true, silent = true, desc = "go to the previous tab page"})
vim.keymap.set("n", "<C-Right>", ":+tabn<CR>", {noremap = true, silent = true, desc = "go to the next tab page"})

vim.keymap.set("n", "<C-A-0>", ":0tabm<CR>", {noremap = true, silent = true, desc = "move the tab page to the first"})
vim.keymap.set("n", "<C-A-Left>", ":-tabm<CR>", {noremap = true, silent = true, desc = "move the tab page to the left"})
vim.keymap.set("n", "<C-A-Right>", ":+tabm<CR>", {noremap = true, silent = true, desc = "move the tab page to the right"})


vim.keymap.set("n", "<leader>fz", ":FzfLua files<CR>", {noremap = true, silent = true, desc = "fzf files"})
