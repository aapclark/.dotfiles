local lspconfig = require("lspconfig")
local _border = "single"
local _max_width = 80

-- Shoutout to `lewis6991` https://github.com/neovim/neovim/pull/31031#issuecomment-2452229172
local function with(f, config)
	return function(c)
		return f(vim.tbl_deep_extend("force", config, c or {}))
	end
end

local function apply_keymaps_with_opts(keymaps, opts)
	for _, mapping in ipairs(keymaps) do
		vim.keymap.set(mapping.mode, mapping.lhs, mapping.rhs, opts)
	end
end

local function setup_diagnostics()
	vim.diagnostic.config({
		virtual_text = true,
		severity_sort = true,
		underline = true,
		float = {
			border = _border,
			focusable = false,
			source = true,
			max_width = _max_width,
			format = function(diagnostic)
				return string.format("[%s] %s (%s)", diagnostic.code or "?", diagnostic.message, diagnostic.source)
			end,
		},
	})
end

local function setup_handlers()
	vim.lsp.buf.signature_help = with(vim.lsp.buf.signature_help, {
		border = _border,
		title_pos = "left",
		max_width = _max_width,
	})
	vim.lsp.buf.hover = with(vim.lsp.buf.hover, { border = _border, max_width = _max_width })
end

setup_handlers()
setup_diagnostics()

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspAttach", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		local kms = {
			{ mode = "n", lhs = "<space>rn", rhs = vim.lsp.buf.rename },
			{ mode = "n", lhs = "<space>ca", rhs = vim.lsp.buf.code_action },
			{ mode = "n", lhs = "K",         rhs = vim.lsp.buf.hover },
			{ mode = "n", lhs = "<c-k>",     rhs = vim.lsp.buf.hover },
			{ mode = "n", lhs = "gd",        rhs = vim.lsp.buf.definition },
			{ mode = "n", lhs = "gD",        rhs = vim.lsp.buf.declaration },
			{ mode = "n", lhs = "gr",        rhs = vim.lsp.buf.references },
			{ mode = "n", lhs = "gt",        rhs = vim.lsp.buf.type_definition },
		}
		if client.supports_method("textDocument/implementation") then
			local gi = { mode = "n", lhs = "gi", rhs = vim.lsp.buf.implementation }
			table.insert(kms, gi)
		end
		if client.supports_method("textDocument/completion") then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
		if client.supports_method("textDocument/formatting") then
			local af = {
				mode = "n",
				lhs = "<space>f",
				rhs = function()
					vim.lsp.buf.format({ async = true })
				end,
			}
			table.insert(kms, af)
			-- Format the current buffer on save
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
				end,
			})
		end
		apply_keymaps_with_opts(kms, { noremap = true, silent = true, buffer = args.buf })
	end,
})

lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			checkOnSave = {
				command = "clippy",
			},
		},
	},
})

lspconfig.gopls.setup({
	cmd = { "gopls", "--remote=auto" },
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})

lspconfig.lua_ls.setup({
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
