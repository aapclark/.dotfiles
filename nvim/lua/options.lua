local g = vim.g
local f = require('helpers.functions')
local opt = f.opt

-- TODO LSP

-- Variables
g['mapleader'] = ' '
g['netrw_gx'] = '<cWORD>'

-- Options
local indent = 2
vim.cmd 'filetype plugin indent on'
vim.o.shortmess = vim.o.shortmess .. 'c'
vim.o.path = vim.o.path .. '**'

-- Global
opt('o', 'swapfile', false)
opt('o', 'termguicolors', true)
opt('o', 'hidden', true)
opt('o', 'showtabline', 1)
opt('o', 'updatetime', 300)
opt('o', 'showmode', false)
opt('o', 'splitbelow', true)
opt('o', 'tabstop', 2)
opt('o', 'showmatch', true)
opt('o', 'laststatus', 2)
opt('o', 'wildignore', '.git,*/node_modules/*,*/target/*,.metals,.bloop')
opt('o', 'ignorecase', true)
opt('o', 'smartcase', true)
opt('o', 'clipboard', 'unnamed')
opt('o', 'completeopt', 'menuone,noselect')

-- window-scoped
opt('w', 'wrap', false)
opt('w', 'cursorline', true)
opt('w', 'signcolumn', 'yes')
opt('w', 'number', true)

-- buffer-scoped
opt('b', 'tabstop', indent)
opt('b', 'shiftwidth', indent)
opt('b', 'softtabstop', indent)
opt('b', 'expandtab', true)
opt('b', 'fileformat', 'unix')
