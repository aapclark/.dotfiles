-- installed via: Mason (tsgo)
-- executable guard is a safety net only — Mason manages the install
return (function()
	if vim.fn.executable("tsgo") == 0 then
		return {}
	end
	return {
		cmd = { "tsgo", "--lsp", "--stdio" },
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		root_markers = { "tsconfig.json", "jsconfig.json", "package.json", ".git" },
		workspace_required = true,
	}
end)()
