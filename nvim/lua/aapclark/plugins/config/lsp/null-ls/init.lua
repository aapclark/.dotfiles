local null_ls = require("null-ls")
local b = null_ls.builtins
local M = {}

local sources = {
	-- JS html css stuff
	b.formatting.prettierd.with({
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
		},
	}),
	b.diagnostics.eslint.with({
		command = "eslint_d",
	}),
	-- Lua
	b.formatting.stylua,
	b.diagnostics.luacheck.with({
		extra_args = { "--global vim" },
	}),
	-- Shell
	b.formatting.shfmt,
	b.diagnostics.shellcheck.with({ diagnostics_format = "#{m} [#{c}]" }),
	-- Dockerfile
	b.diagnostics.hadolint,
	-- Prisma
	b.formatting.prismaFmt,
}

M.setup = function(lsp_opts)
	null_ls.config({
		sources = sources,
	})
	require("lspconfig")["null-ls"].setup({
		on_attach = function(client)
			lsp_opts.on_attach(client)
		end,
	})
end

return M
