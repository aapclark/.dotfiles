local lint = require("lint")

lint.linters_by_ft = vim.tbl_deep_extend("force", lint.linters_by_ft or {}, {
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
})

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
