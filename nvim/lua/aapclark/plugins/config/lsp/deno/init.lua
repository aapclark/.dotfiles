local lsp = require("lspconfig")
local rd = lsp.util.root_pattern("deno.json", "deno.jsonc", "mod.ts")

local M = {}

function M.setup(lsp_opts)
	lsp.denols.setup({
		root_dir = rd,
		cmd = { "deno", "lsp" },
		capabilities = lsp_opts.capabilities,
		filetypes = {
			"javascript",
			"typescript",
		},
		init_options = {
			lint = true,
			unstable = true,
			-- enable = lsp.util.root_pattern("deno.json", "deno.jsonc", "mod.ts", "main.ts"),
			enable = true,
		},
		on_attach = function(client)
			if client.config.flags then
				client.config.flags.allow_incremental_sync = true
			end

			lsp_opts.on_attach(client)
		end,
	})
end

--[[ vim.g.markdown_fenced_languages = {
  "ts=typescript"
} ]]
return M
