local path = (...):gsub("%.init$", "")
local attach_server = require(path .. ".on_attach").attach_server

local diag = vim.lsp.diagnostic.on_publish_diagnostics

-- Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(diag, {
	signs = true,
	virtual_text = false,
	update_in_insert = true,
	underline = true,
})

attach_server("tsserver")
attach_server("go")
attach_server("rust")
attach_server("sumneko_lua")
attach_server("null-ls")
-- attach_server("deno")
attach_server("nim")
