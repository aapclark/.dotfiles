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

		if client.supports_method("textDocument/implementation") then
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		end

		-- Disable ts_ls formatting when Biome is present: Biome owns JS/TS formatting.
		if client.name == "ts_ls" then
			client.server_capabilities.documentFormattingProvider = false
		end

		if client.supports_method("textDocument/formatting") then
			vim.keymap.set("n", "<space>f", function()
				vim.lsp.buf.format({ async = true })
			end, opts)
		end

		-- Biome: apply fixAll (import sorting, lint auto-fixes) on save.
		if client.name == "biome" then
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = vim.api.nvim_create_augroup("BiomeFixAll", { clear = true }),
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.code_action({
						context = { only = { "source.fixAll.biome" }, diagnostics = {} },
						apply = true,
					})
				end,
			})
		end
	end,
})

-- ---------------------------------------------------------------------------
-- Server configurations
-- ---------------------------------------------------------------------------

vim.lsp.config("ts_ls", {
	filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
	root_markers = { "package.json", "tsconfig.json", "jsconfig.json", ".git" },
	init_options = {
		preferences = {
			disableSuggestions = false,
			includeCompletionsForModuleExports = true,
			includeCompletionsWithInsertText = true,
		},
	},
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
})

vim.lsp.config("eslint", {
	cmd = { "eslint_d", "--stdio" },
	filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
	root_markers = {
		".eslintrc.js",
		".eslintrc.cjs",
		".eslintrc.json",
		".eslintrc.yml",
		".eslintrc.yaml",
		"eslint.config.js",
		"eslint.config.mjs",
		"eslint.config.cjs",
	},
})

vim.lsp.config("rust_analyzer", {
	settings = {
		["rust-analyzer"] = {
			checkOnSave = { command = "clippy" },
		},
	},
})

vim.lsp.config("gopls", {
	cmd = { "gopls", "--remote=auto" },
	root_markers = { "go.mod", "go.work", ".git" },
	settings = {
		gopls = {
			analyses = { unusedparams = true },
			staticcheck = true,
			gofumpt = true,
		},
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
})

-- ---------------------------------------------------------------------------
-- Enable all servers
-- ---------------------------------------------------------------------------

vim.lsp.enable({
	"ts_ls",
	"eslint",
	"rust_analyzer",
	"gopls",
	"golangci_lint_ls",
	"lua_ls",
	"sqlls",
	"graphql",
	"biome",
})
