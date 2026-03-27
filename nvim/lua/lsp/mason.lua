require("mason").setup()

require("mason-tool-installer").setup({
	ensure_installed = {
		"gopls",
		"tsgo",
		"biome",
		"eslint_d",
		"prettierd",
		"golangci-lint",
		"golangci-lint-langserver",
	},
})
