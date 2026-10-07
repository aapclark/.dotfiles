-- lazy.nvim spec. Plugins with non-trivial setup keep their config in
-- lua/plugins/<name>.lua and are required from `config` here so they only run
-- when the plugin actually loads.
return {
	-- Colorscheme: load first so everything else picks up its highlights.
	{
		"catppuccin/nvim",
		name = "catppuccin",
		lazy = false,
		priority = 1000,
		config = function()
			require("catppuccin").setup({ flavour = "latte" }) -- latte, frappe, macchiato, mocha
			vim.cmd.colorscheme("catppuccin")
		end,
	},

	-- UI
	{
		"goolord/alpha-nvim",
		event = "VimEnter",
		config = function()
			require("plugins.alpha-nvim")
		end,
	},
	{
		"echasnovski/mini.statusline",
		version = false,
		lazy = false,
		opts = { use_icons = false },
	},
	{
		"mvllow/modes.nvim",
		event = "VeryLazy",
		opts = {
			line_opacity = 0.15,
			set_cursor = true,
			ignore = { "TelescopePrompt" },
		},
	},
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
		"folke/trouble.nvim",
		cmd = "Trouble",
		opts = {},
		keys = {
			{ "<leader>tr", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
			{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
			{ "<leader>ts", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "Symbols (Trouble)" },
			{
				"<leader>tl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{ "<leader>tL", "<cmd>Trouble loclist toggle<cr>", desc = "Location List (Trouble)" },
			{ "<leader>tQ", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
		},
	},
	{ "ellisonleao/glow.nvim", cmd = "Glow", opts = {} },

	-- Editing
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("plugins.autopairs")
		end,
	},
	{ "nmac427/guess-indent.nvim", event = "BufReadPre", opts = {} },
	{
		"lewis6991/gitsigns.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("plugins.gitsigns")
		end,
	},

	-- Completion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"saadparwaiz1/cmp_luasnip",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require("plugins.nvim-cmp")
		end,
	},
	-- Required at startup by lsp/lspconfig.lua for capabilities.
	{ "hrsh7th/cmp-nvim-lsp", lazy = true },

	-- Telescope: loads on :Telescope or on the first require() from keymaps.lua.
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			require("plugins.telescope")
		end,
	},

	-- Treesitter (main branch, see lua/plugins/treesitter.lua)
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("plugins.treesitter")
		end,
	},

	-- LSP, formatting, linting
	-- Supplies cmd/filetypes/root_markers defaults for vim.lsp.enable(); the
	-- configs under nvim/lsp/*.lua only override what differs.
	{ "neovim/nvim-lspconfig", lazy = false },
	{
		-- Eager so mason's bin dir is on PATH before any server starts.
		"williamboman/mason.nvim",
		lazy = false,
		build = ":MasonUpdate",
		dependencies = { "WhoIsSethDaniel/mason-tool-installer.nvim" },
		config = function()
			require("mason").setup()
			require("mason-tool-installer").setup({
				ensure_installed = {
					"gopls",
					"tsgo",
					"biome",
					"eslint_d",
					"prettierd",
					"golangci-lint",
					"golangci-lint-langserver",
					"lua-language-server",
					"stylua",
					"json-lsp",
				},
				run_on_start = false,
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = "ConformInfo",
		config = function()
			require("lsp.conform")
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require("lsp.lint")
		end,
	},
}
