local c = require("conform")

c.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "eslint_d", "prettier", stop_after_first = true },
		typescript = { "eslint_d", "prettier", stop_after_first = true },
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
