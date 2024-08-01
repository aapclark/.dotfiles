local config = require("aapclark.utils").config

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	{ "rebelot/kanagawa.nvim" },
	{ "junegunn/fzf" },
	{ "junegunn/fzf.vim" },
	{ "b3nj5m1n/kommentary" },
	{ "nvim-lua/lsp-status.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"folke/trouble.nvim",

		cmd = "Trouble",
		keys = {
			{
				"<leader>tr",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>ts",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>tl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>tL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>tQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
	{ "jubnzv/virtual-types.nvim" },
	{ "bfredl/nvim-luadev" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "L3MON4D3/LuaSnip" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-telescope/telescope-fzy-native.nvim" },
	{ "nvim-telescope/telescope-dap.nvim" },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "nvim-treesitter/nvim-treesitter",           build = ":TSUpdate" },
	{ "nvim-treesitter/playground" },
	{ "goolord/alpha-nvim" },
	{ "windwp/nvim-autopairs" },
	{ "nmac427/guess-indent.nvim" },
	{ "lewis6991/gitsigns.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "nvimtools/none-ls.nvim" },
	{ "neovim/nvim-lspconfig" },
	{
		"stevearc/conform.nvim",
		opts = {},
	},
	{ "mvllow/modes.nvim" },
	{ "ellisonleao/glow.nvim" },
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},
	{ "williamboman/mason-lspconfig.nvim" },
	{
		"vhyrro/luarocks.nvim",
		priority = 1000,
		config = true,
	},
	{
		"jesseleite/nvim-noirbuddy",
		dependencies = {
			{ "tjdevries/colorbuddy.nvim" },
		},
		lazy = false,
		priority = 1000,
		opts = {
			preset = "slate",
			-- All of your `setup(opts)` will go here
		},
	},
	{ "echasnovski/mini.statusline",      version = false },
}

require("lazy").setup(plugins)
require("mini.statusline").setup({
	use_icons = false,
})

-- config("kanagawa")
config("treesitter")
config("lsp")
config("lsp.mason")
config("nvim-cmp")
config("telescope")
config("autopairs")
config("gitsigns")
config("guess-indent")
config("alpha-nvim")
config("trouble")
config("modes")
-- config("that-line")
-- config("rest")
config("lsp.conform")
