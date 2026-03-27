-- installed via: Mason (biome)
-- only attaches when biome.json or biome.jsonc exists in the project root
return {
	cmd = { "biome", "lsp-proxy" },
	filetypes = {
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"json",
		"jsonc",
	},
	root_markers = { "biome.json", "biome.jsonc" },
	workspace_required = true,
}
