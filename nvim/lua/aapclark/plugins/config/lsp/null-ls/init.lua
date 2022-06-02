local null_ls = require("null-ls")
local b = null_ls.builtins
local lspPath = require("lspconfig.util").path
local hasPackageJson = require("aapclark.utils").hasPackageJson
local hasDenoJson = require("aapclark.utils").hasDenoJson
local cwd = vim.fn.getcwd()
local M = {}

local sources = {
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
	-- Deno
	b.diagnostics.yamllint,
	-- Go Linter Aggregator
	b.diagnostics.golangci_lint,
}

if hasPackageJson(cwd) or lspPath.traverse_parents(cwd, hasPackageJson) or not hasDenoJson(cwd) then
	sources[#sources + 1] = b.formatting.prettierd.with({
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
	})

	sources[#sources + 1] = b.formatting.prettierd.with({
		filetypes = {
			"html",
			"json",
			"markdown",
			"css",
			"graphql",
			"yaml",
		},
	})

	sources[#sources + 1] = b.diagnostics.eslint_d.with({
		command = "eslint_d",
	})
end

if hasDenoJson(cwd) or lspPath.traverse_parents(cwd, hasDenoJson) then
	sources[#sources + 1] = b.formatting.deno_fmt.with({
		filetypes = { "typescript, javascript" },
	})
end

M.setup = function(lsp_opts)
	require("null-ls").setup({
		sources = sources,
		on_attach = function(client)
			lsp_opts.on_attach(client)
		end,
	})
end

return M
