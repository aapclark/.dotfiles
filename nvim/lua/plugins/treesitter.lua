-- nvim-treesitter `main` branch API.
-- The old `configs.setup{ ensure_installed, highlight }` is a no-op here:
-- parsers are installed via require("nvim-treesitter").install(), and
-- highlighting is started per-buffer with vim.treesitter.start().

local ts = require("nvim-treesitter")

local ensure_installed = {
	"bash",
	"css",
	"diff",
	"git_config",
	"gitcommit",
	"go",
	"gomod",
	"gosum",
	"gowork",
	"graphql",
	"html",
	"javascript",
	"json",
	"lua",
	"luadoc",
	"markdown",
	"markdown_inline",
	"prisma",
	"query",
	"regex",
	"rust",
	"sql",
	"toml",
	"tsx",
	"typescript",
	"vim",
	"vimdoc",
	"yaml",
}

ts.setup({})

local installed = ts.get_installed("parsers")
local have = {}
for _, p in ipairs(installed) do
	have[p] = true
end

local missing = {}
for _, p in ipairs(ensure_installed) do
	if not have[p] then
		table.insert(missing, p)
	end
end

-- `main`-branch nvim-treesitter compiles parsers with the tree-sitter CLI.
-- Without it every install fails loudly on startup, so only try when present.
if #missing > 0 and vim.fn.executable("tree-sitter") == 1 then
	ts.install(missing)
elseif #missing > 0 then
	vim.notify(
		("nvim-treesitter: tree-sitter CLI not found, %d parsers not installed"):format(#missing),
		vim.log.levels.WARN
	)
end

-- Start highlighting for any filetype that has a parser available.
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("treesitter_start", { clear = true }),
	callback = function(args)
		local ft = args.match
		if ft == "" then
			return
		end
		local lang = vim.treesitter.language.get_lang(ft) or ft
		if not vim.tbl_contains(ts.get_installed("parsers"), lang) then
			return
		end
		pcall(vim.treesitter.start, args.buf, lang)
		vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
