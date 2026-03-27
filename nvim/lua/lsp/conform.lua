require("conform").setup({
	format_on_save = { timeout_ms = 500, lsp_format = "never" },
	formatters_by_ft = {
		-- Go formatting handled by BufWritePre autocmd in lspconfig.lua (organize imports + gopls format)
		typescript = { "biome", "prettierd", stop_after_first = true },
		typescriptreact = { "biome", "prettierd", stop_after_first = true },
		javascript = { "biome", "prettierd", stop_after_first = true },
		javascriptreact = { "biome", "prettierd", stop_after_first = true },
		json = { "biome", "prettierd", stop_after_first = true },
		jsonc = { "biome", "prettierd", stop_after_first = true },
		css = { "prettierd" },
		html = { "prettierd" },
		markdown = { "prettierd" },
		lua = { "stylua" },
	},
})
