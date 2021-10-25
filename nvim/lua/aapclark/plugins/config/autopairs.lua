require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt", "vim" },
	check_ts = true,
	fast_wrap = {
		map = "<M-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		hightlight = "Search",
	},
})

vim.api.nvim_set_keymap("i", "<CR>", "v:lua.MPairs.autopairs_cr()", { expr = true, noremap = true })
