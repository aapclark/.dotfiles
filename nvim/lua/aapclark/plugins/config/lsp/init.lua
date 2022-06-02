local path = (...):gsub("%.init$", "")
local attach_server = require(path .. ".on_attach").attach_server
local lspPath = require("lspconfig.util").path
local hasPackageJson = require("aapclark.utils").hasPackageJson
local hasDenoJson = require("aapclark.utils").hasDenoJson
local cwd = vim.fn.getcwd()

local diag = vim.lsp.diagnostic.on_publish_diagnostics

-- Diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(diag, {
	signs = true,
	virtual_text = true,
	update_in_insert = true,
	underline = true,
	border = "single",
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

if hasPackageJson(cwd) or lspPath.traverse_parents(cwd, hasPackageJson) then
	attach_server("tsserver")
end
attach_server("go")
attach_server("rust")
attach_server("sumneko_lua")
attach_server("null-ls")
if hasDenoJson(cwd) or lspPath.traverse_parents(cwd, hasDenoJson) then
	attach_server("deno")
end
attach_server("nim")
