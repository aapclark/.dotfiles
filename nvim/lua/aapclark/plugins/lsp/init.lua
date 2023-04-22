local fmtgroup = vim.api.nvim_create_augroup("LspFormatting", {})
local lspconfig = require("lspconfig")
local null_ls = require("null-ls")

local on_attach = function(client, bufnr)
	diagnostics_format = "[#{c}] #{m} (#{s})", vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
	vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
	vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
	-- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set("n", "<space>wl", function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
	vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
	vim.keymap.set("n", "<space>f", function()
		vim.lsp.buf.format({ async = true })
	end, bufopts)

	require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
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
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = fmtgroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = fmtgroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end,
		})
	end
end

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	signs = true,
	virtual_text = true,
	update_in_insert = true,
	underline = true,
	border = "single",
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

lspconfig.tsserver.setup({
	on_attach = on_attach,
	flags = lsp_flags,
})

lspconfig.graphql.setup({
	on_attach = on_attach,
})

lspconfig.gopls.setup({
	on_attach = on_attach,
	cmd = { "gopls", "--remote=auto" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = false,
			},
			staticcheck = true,
		},
	},
})

lspconfig.nimls.setup({
	on_attach = on_attach,
})

lspconfig.prismals.setup({
	on_attach = on_attach,
})

lspconfig.lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

local function has_eslintrc(utils)
	return utils.root_has_file(".eslintrc.js")
end

local b = null_ls.builtins
null_ls.setup({
	sources = {
		-- Lua
		b.formatting.stylua,
		b.diagnostics.luacheck.with({
			extra_args = { "--global vim" },
		}),
		b.formatting.shfmt,
		b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
		b.diagnostics.hadolint,
		b.formatting.prismaFmt,
		b.diagnostics.yamllint,
		b.diagnostics.golangci_lint,
		b.diagnostics.buf,

		null_ls.builtins.code_actions.eslint_d.with({ condition = has_eslintrc }),
		null_ls.builtins.diagnostics.eslint_d.with({ condition = has_eslintrc }),
		null_ls.builtins.formatting.eslint_d.with({ condition = has_eslintrc }),

		b.formatting.prettierd.with({
			condition = function()
				local eslintd_enabled = #null_ls.get_source({
					name = "eslint_d",
					method = null_ls.methods.FORMATTING,
				})
				return eslintd_enabled == 0
			end,
			filetypes = {
				"html",
				"json",
				"markdown",
				"css",
				"javascript",
				"javascriptreact",
				"typescript",
				"typescriptreact",
				"graphql",
				"yaml",
			},
		}),
	},
	on_attach = on_attach,
})
