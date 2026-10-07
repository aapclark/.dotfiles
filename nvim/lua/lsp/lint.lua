local lint = require("lint")

lint.linters_by_ft = vim.tbl_deep_extend("force", lint.linters_by_ft or {}, {
	typescript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	javascript = { "eslint_d" },
	javascriptreact = { "eslint_d" },
})

vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
	callback = function()
		local names = lint.linters_by_ft[vim.bo.filetype] or {}
		local runnable = {}
		for _, name in ipairs(names) do
			local linter = lint.linters[name]
			local cmd = type(linter) == "table" and linter.cmd or nil
			if type(cmd) == "function" then
				local ok, resolved = pcall(cmd)
				cmd = ok and resolved or nil
			end
			if cmd and vim.fn.executable(cmd) == 1 then
				table.insert(runnable, name)
			end
		end
		if #runnable > 0 then
			lint.try_lint(runnable)
		end
	end,
})
