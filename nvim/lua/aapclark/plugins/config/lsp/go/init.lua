local lsp = require("lspconfig")

local M = {}
-- local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

function M.setup(lsp_opts)
	lsp.gopls.setup({
		capabilities = lsp_opts.capabilities,
		-- capabilities = capabilities,
		on_attach = function(client)
			lsp_opts.on_attach(client)
			vim.wo.list = false

			client.server_capabilities.document_formatting = true
			client.server_capabilities.document_highlighting = false
		end,
		cmd = { "gopls", "serve" },
		settings = {
			gopls = {
				analyses = {
					unusedparams = false,
				},
				staticcheck = true,
			},
		},
	})
end

return M
