vim.g.mapleader = " "

local indent = 2

-- UI
vim.o.termguicolors = true
vim.api.nvim_create_autocmd("UIEnter", {
	once = true,
	callback = function()
		vim.schedule(function()
			vim.o.cmdheight = 0
		end)
	end,
})
vim.o.showmode = false
vim.o.showtabline = 1
vim.o.laststatus = 3
vim.o.showmatch = true
vim.o.splitbelow = true
vim.o.shortmess = vim.o.shortmess .. "cI"

-- Editing
vim.o.swapfile = false
vim.o.updatetime = 300
vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menuone,noselect"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.opt.path:append("**")
vim.o.wildignore = ".git,*/node_modules/*,*/target/*,.metals,.bloop"

-- Indentation (vim.opt correctly applies to both global and buffer scope)
vim.opt.tabstop = indent
vim.opt.shiftwidth = indent
vim.opt.softtabstop = indent
vim.opt.expandtab = true
vim.opt.fileformat = "unix"

-- Window
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.number = true

vim.api.nvim_set_hl(0, "WinSeparator", { bg = "None" })
