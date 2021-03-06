vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup({
	space_char_blankline = " ",
	show_current_context = false,
	show_current_context_start = true,
	use_treesitter = true,
	bufname_exclude = { "" },
})
