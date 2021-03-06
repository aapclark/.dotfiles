local lsp = require("lspconfig")
local rd = lsp.util.root_pattern("package.json", "tsconfig.json")
local vt = require("virtualtypes")

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local M = {}

function M.setup(lsp_opts)
	lsp.tsserver.setup({
		root_dir = rd,
		init_options = {
			documentHighlight = false,
			publishDiagnostics = true,
			-- enable = false,
		},
		capabilities = lsp_opts.capabilities,
		commands = {
			OrganizeImports = {
				function()
					local params = {
						command = "_typescript.organizeImports",
						arguments = { vim.api.nvim_buf_get_name(0) },
						title = "",
					}
					vim.lsp.buf.execute_command(params)
				end,
				description = "Organize Imports",
			},
		},
		on_attach = function(client, bufnr)
			if client.config.flags then
				client.config.flags.allow_incremental_sync = true
			end
      if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                    vim.lsp.buf.formatting_sync()
                end,
            })
        end

			local ts_utils = require("nvim-lsp-ts-utils")

			vt.on_attach()

			ts_utils.setup({
				eslint_bin = "eslint_d",
				eslint_enable_diagnostics = true,
			})

			ts_utils.setup_client(client)
			lsp_opts.on_attach(client)
		end,
	})
end

return M
