-- API aliases

local cmd = vim.cmd
-- local fn = vim.fn
local g = vim.g
local opt = vim.opt

g.mapleader = ' '
g.maplocalleader = ' '

-- Nerd font installed and selected in terminal
g.have_nerd_font = true

opt.number = true
opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
opt.showmode = false

-- Enable break indent
opt.breakindent = true

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- vim.wo.foldmethod = 'expr'
-- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

cmd('set expandtab')
cmd('set tabstop=2')
cmd('set softtabstop=2')
cmd('set shiftwidth=2')

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})
