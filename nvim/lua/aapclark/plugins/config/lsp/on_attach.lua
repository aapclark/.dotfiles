local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
local attach_server_with = require("aapclark.utils").attach_server_with

local M = {}

local on_attach = function(client)
	if client.name ~= "null-ls" then
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.range_formatting = false
	end

	client.resolved_capabilities.document_highlighting = false

	vim.cmd([[
        augroup HoverDiagnostics
            au!
            au CursorHold <buffer> lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false })
        augroup END
    ]])

	if client.resolved_capabilities.document_formatting then
		vim.cmd([[
            augroup Format
                au! * <buffer>
                au BufWritePre <buffer> lua vim.lsp.buf.formatting_sync(nil, 1000)
            augroup END
        ]])
	end
end

M.attach_server = attach_server_with(on_attach, capabilities)

return M
