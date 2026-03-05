local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local custom = augroup("custom", { clear = true })

-- Disable continuation comment leaders
autocmd("FileType", {
	group = custom,
	pattern = "*",
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

-- Markdown: hard-wrap at 80 columns
autocmd("FileType", {
	group = custom,
	pattern = "markdown",
	callback = function()
		vim.opt_local.textwidth = 80
	end,
})

-- JS: highlight column 81
autocmd("BufEnter", {
	group = custom,
	pattern = "*.js",
	callback = function()
		vim.fn.matchadd("ColorColumn", "\\%81v", 100)
	end,
})

-- Prose buffers: wrap, spell, kspell completion
autocmd({ "BufReadPost", "BufNewFile" }, {
	group = custom,
	pattern = { "*.md", "*.txt", "COMMIT_EDITMSG" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.list = false
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us"
		vim.opt_local.complete:append("kspell")
	end,
})

autocmd({ "BufReadPost", "BufNewFile" }, {
	group = custom,
	pattern = { "*.html", "*.txt", "*.md", "*.adoc" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us"
	end,
})

-- Terminal: enter insert mode and fix height
autocmd("TermOpen", {
	group = custom,
	pattern = "*",
	callback = function()
		vim.cmd("startinsert")
		vim.wo.winfixheight = true
	end,
})

-- Highlight yanked text (vim.hl replaces deprecated vim.highlight in 0.12)
autocmd("TextYankPost", {
	group = custom,
	pattern = "*",
	callback = function()
		vim.hl.on_yank({ timeout = 200 })
	end,
})

-- Trim trailing whitespace on save, preserving cursor position
autocmd("BufWritePre", {
	group = custom,
	pattern = "*",
	callback = function()
		local pos = vim.api.nvim_win_get_cursor(0)
		vim.cmd([[%s/\s\+$//e]])
		vim.api.nvim_win_set_cursor(0, pos)
	end,
})
