require("nvim-treesitter.configs").setup({
	playground = { enable = true },
	query_linter = {
		enable = true,
		use_virtual_text = true,
		lint_events = { "BufWrite", "CursorHold" },
	},
	ensure_installed = {
		"bash",
		"css",
		"go",
		"graphql",
		"html",
		-- "javascript",
		"json",
		"lua",
		"rust",
		-- "tsx",
		"typescript",
	},
	highlight = { enable = true },
	autopairs = { enable = true },
})
