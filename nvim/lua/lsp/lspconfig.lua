local _max_width = 80

-- Global border for all floating windows (0.11+).
vim.o.winborder = "single"

-- ---------------------------------------------------------------------------
-- Diagnostics
-- ---------------------------------------------------------------------------

vim.diagnostic.config({
	virtual_text = true,
	severity_sort = true,
	underline = true,
	update_in_insert = false,
	float = {
		focusable = false,
		source = true,
		max_width = _max_width,
		format = function(diagnostic)
			return string.format("[%s] %s (%s)", diagnostic.code or "?", diagnostic.message, diagnostic.source)
		end,
	},
})

-- ---------------------------------------------------------------------------
-- Capabilities (broadcast to all servers)
-- ---------------------------------------------------------------------------

vim.lsp.config("*", {
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- ---------------------------------------------------------------------------
-- LspAttach: keymaps & format-on-save
-- ---------------------------------------------------------------------------
--
-- Note: Neovim 0.11+ default LSP mappings (already bound, kept here as aliases
-- or intentionally overridden):
--   grn  → vim.lsp.buf.rename
--   gra  → vim.lsp.buf.code_action  (normal + visual)
--   grr  → vim.lsp.buf.references
--   gri  → vim.lsp.buf.implementation
--   gO   → vim.lsp.buf.document_symbol
--   C-s  → vim.lsp.buf.signature_help  (insert mode, see override below)

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspAttach", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		local opts = { noremap = true, silent = true, buffer = args.buf }

		-- In 0.12, vim.lsp.handlers.signature_help() is deprecated.
		-- Pass max_width directly at the call site instead of via handler overrides.
		vim.keymap.set("n", "K", function()
			vim.lsp.buf.hover({ max_width = _max_width })
		end, opts)
		vim.keymap.set({ "i", "n" }, "<C-s>", function()
			vim.lsp.buf.signature_help({ max_width = _max_width, title_pos = "left" })
		end, opts)

		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)

		if client:supports_method("textDocument/implementation") then
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		end

		if client:supports_method("textDocument/formatting") then
			vim.keymap.set("n", "<space>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end
	end,
})

-- ---------------------------------------------------------------------------
-- Go: organize imports + format on save
-- ---------------------------------------------------------------------------

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function(args)
		local clients = vim.lsp.get_clients({ bufnr = args.buf, name = "gopls" })
		if #clients == 0 then
			return
		end
		local client = clients[1]
		local params = vim.lsp.util.make_range_params(0, client.offset_encoding)
		params.context = { only = { "source.organizeImports" } }
		local result = vim.lsp.buf_request_sync(args.buf, "textDocument/codeAction", params, 3000)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					vim.lsp.util.apply_workspace_edit(r.edit, client.offset_encoding)
				end
			end
		end
		vim.lsp.buf.format({ async = false })
	end,
})

-- ---------------------------------------------------------------------------
-- Inlay hints
-- ---------------------------------------------------------------------------

vim.lsp.inlay_hint.enable(true)

-- ---------------------------------------------------------------------------
-- Enable all servers
-- ---------------------------------------------------------------------------

vim.lsp.enable({
	"gopls",
	"tsgo",
	"biome",
	"golangci_lint_ls",
	"lua_ls",
	"rust_analyzer",
	"sqlls",
	"graphql",
	"jsonls",
})
