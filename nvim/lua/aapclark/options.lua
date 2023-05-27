local g = vim.g
local utils = require("aapclark.utils")
local oopt = utils.oopt
local wopt = utils.wopt
local bopt = utils.bopt

-- Variables
g["mapleader"] = " "
g["netrw_gx"] = "<cWORD>"

-- Options
local indent = 2
vim.cmd("filetype plugin indent on")
vim.o.shortmess = vim.o.shortmess .. "c"
vim.o.path = vim.o.path .. "**"

vim.cmd("set cmdheight=0")

-- Global
oopt("swapfile", false)
oopt("termguicolors", true)
oopt("hidden", true)
oopt("showtabline", 1)
oopt("updatetime", 300)
oopt("showmode", false)
oopt("splitbelow", true)
oopt("tabstop", 2)
oopt("showmatch", true)
oopt("laststatus", 2)
oopt("wildignore", ".git,*/node_modules/*,*/target/*,.metals,.bloop")
oopt("ignorecase", true)
oopt("smartcase", true)
oopt("clipboard", "unnamed")
oopt("completeopt", "menuone,noselect")
oopt("laststatus", 3)
vim.cmd("highlight WhthSeparator guibg=None")

-- window-scoped
wopt("wrap", false)
wopt("cursorline", true)
wopt("signcolumn", "yes")
wopt("number", true)

-- buffer-scoped
bopt("tabstop", indent)
bopt("shiftwidth", indent)
bopt("softtabstop", indent)
bopt("expandtab", true)
bopt("fileformat", "unix")
