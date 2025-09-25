local c = require("conform")

local function has_eslint_config()
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
	
	local cwd = vim.fn.getcwd()
	for _, config in ipairs(eslint_configs) do
		if vim.fn.filereadable(cwd .. "/" .. config) == 1 then
			return true
		end
	end
	
	local package_json = cwd .. "/package.json"
	if vim.fn.filereadable(package_json) == 1 then
		local ok, package_data = pcall(vim.fn.json_decode, vim.fn.readfile(package_json))
		if ok and package_data and package_data.eslintConfig then
			return true
		end
	end
	
	return false
end

local js_formatters = has_eslint_config() and { "eslint_d", "prettier", stop_after_first = true } or { "prettier" }

c.setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = js_formatters,
		typescript = js_formatters,
	},
	format_on_save = {
		timeout_ms = 500,
		lsp_fallback = true,
	},
})
