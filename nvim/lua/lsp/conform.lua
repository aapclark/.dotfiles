local c = require("conform")

local eslint_configs = {
	".eslintrc.js",
	".eslintrc.cjs",
	".eslintrc.json",
	".eslintrc.yml",
	".eslintrc.yaml",
	"eslint.config.js",
	"eslint.config.mjs",
	"eslint.config.cjs",
}

local function has_eslint_config(bufnr)
	local bufpath = vim.api.nvim_buf_get_name(bufnr)
	if bufpath == "" then
		return false
	end

	local dir = vim.fs.dirname(bufpath)
	local root = vim.fs.root(bufnr, eslint_configs) or vim.fs.root(bufnr, "package.json")

	if not root then
		return false
	end

	for _, config in ipairs(eslint_configs) do
		if vim.uv.fs_stat(root .. "/" .. config) then
			return true
		end
	end

	local package_json = root .. "/package.json"
	local stat = vim.uv.fs_stat(package_json)
	if stat then
		local ok, data = pcall(vim.fn.json_decode, vim.fn.readfile(package_json))
		if ok and data and data.eslintConfig then
			return true
		end
	end

	return false
end

c.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		-- lsp_format = "first" lets biome (LSP) format when present,
		-- falling back to prettier only if no LSP formatter is available.
		-- eslint_d is added when an eslint config exists in the project.
		javascript = {
			"prettier",
			lsp_format = "first",
			stop_after_first = true,
		},
		typescript = {
			"prettier",
			lsp_format = "first",
			stop_after_first = true,
		},
	},
	format_on_save = function(bufnr)
		local formatters = { timeout_ms = 500, lsp_format = "first" }

		-- Inject eslint_d at the front for buffers that have an eslint config
		local ft = vim.bo[bufnr].filetype
		if (ft == "javascript" or ft == "typescript") and has_eslint_config(bufnr) then
			formatters.formatters = { "eslint_d" }
		end

		return formatters
	end,
})
