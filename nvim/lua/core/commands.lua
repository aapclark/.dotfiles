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

-- JS: mark column 81
autocmd("FileType", {
	group = custom,
	pattern = "javascript",
	callback = function()
		vim.opt_local.colorcolumn = "81"
	end,
})

-- Spell check for prose and markup
autocmd("FileType", {
	group = custom,
	pattern = { "markdown", "text", "gitcommit", "html", "asciidoc" },
	callback = function()
		vim.opt_local.spell = true
		vim.opt_local.spelllang = "en_us"
	end,
})

-- Prose buffers: soft wrap and kspell completion
autocmd("FileType", {
	group = custom,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.list = false
		vim.opt_local.complete:append("kspell")
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

-- Trim trailing whitespace on save, preserving cursor position.
-- Skipped for markdown, where two trailing spaces are a hard line break.
autocmd("BufWritePre", {
	group = custom,
	pattern = "*",
	callback = function(args)
		if vim.bo[args.buf].binary or vim.bo[args.buf].filetype == "markdown" then
			return
		end
		local pos = vim.api.nvim_win_get_cursor(0)
		local save = vim.fn.getreg("/")
		vim.cmd([[keepjumps keeppatterns %s/\s\+$//e]])
		vim.fn.setreg("/", save)
		local lines = vim.api.nvim_buf_line_count(args.buf)
		pos[1] = math.min(pos[1], lines)
		vim.api.nvim_win_set_cursor(0, pos)
	end,
})
