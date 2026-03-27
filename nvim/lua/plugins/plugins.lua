return {
	{ "catppuccin/nvim", name = "catppuccin", priority = 1000, lazy = true },
	{
		"b3nj5m1n/kommentary",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"folke/trouble.nvim",
		lazy = true,
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
	{
		"hrsh7th/nvim-cmp",
		event = { "BufReadPost", "BufNewFile" },
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = false,
	},
	{ "saadparwaiz1/cmp_luasnip", lazy = true },
	{ "L3MON4D3/LuaSnip", lazy = true },
	{ "nvim-telescope/telescope.nvim", lazy = false },
	{ "nvim-telescope/telescope-fzy-native.nvim", lazy = false },
	{ "nvim-telescope/telescope-file-browser.nvim", lazy = false },
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		event = { "BufReadPost", "BufNewFile" },
	},
	{ "goolord/alpha-nvim" },
	{ "windwp/nvim-autopairs", lazy = true },
	{ "nmac427/guess-indent.nvim", lazy = true },
	{ "lewis6991/gitsigns.nvim", lazy = true },
	{ "nvim-lua/plenary.nvim", lazy = true },
	{
		"stevearc/conform.nvim",
		lazy = true,
		opts = {},
	},
	{ "mvllow/modes.nvim", lazy = true },
	{ "ellisonleao/glow.nvim", lazy = true },
	{
		"williamboman/mason.nvim",
		lazy = true,
		build = ":MasonUpdate",
	},
	{ "WhoIsSethDaniel/mason-tool-installer.nvim", lazy = true },
	{ "mfussenegger/nvim-lint", lazy = true },
	{ "echasnovski/mini.statusline", version = false, lazy = true },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {},
	},
	{
		"sudo-tee/opencode.nvim",
		config = function()
			require("opencode").setup({})
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"MeanderingProgrammer/render-markdown.nvim",
				opts = {
					anti_conceal = { enabled = false },
					file_types = { "markdown", "opencode_output" },
				},
				ft = { "markdown", "Avante", "copilot-chat", "opencode_output" },
			},
			-- Optional, for file mentions and commands completion, pick only one
			-- "saghen/blink.cmp",
			"hrsh7th/nvim-cmp",

			-- Optional, for file mentions picker, pick only one
			-- "folke/snacks.nvim",
			"nvim-telescope/telescope.nvim",
			-- 'ibhagwan/fzf-lua',
			-- 'nvim_mini/mini.nvim',
		},
	},
}
