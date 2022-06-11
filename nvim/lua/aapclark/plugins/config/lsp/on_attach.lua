local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local attach_server_with = require("aapclark.utils").attach_server_with

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local M = {}

local on_attach = function(client, bufnr)
	if client.name ~= "null-ls" then
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					vim.lsp.buf.format({ bufnr = bufnr })
				end,
			})
		end
	end

	require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
	client.server_capabilities.document_highlighting = false

	vim.cmd([[
        augroup HoverDiagnostics
            au!
            au CursorHold <buffer> lua vim.diagnostic.open_float({ focusable = false, border = 'single' })
        augroup END
    ]])

	if client.server_capabilities.document_formatting then
		vim.cmd([[
            augroup Format
                au! * <buffer>
                au BufWritePre <buffer> lua vim.lsp.buf.format()
            augroup END
        ]])
	end
end

M.attach_server = attach_server_with(on_attach, capabilities)

return M
