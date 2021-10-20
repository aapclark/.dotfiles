local config = require("aapclark.utils").config

require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use("shaunsingh/nord.nvim")
	use("junegunn/fzf")
	use("junegunn/fzf.vim")
	use("b3nj5m1n/kommentary")
	use("nvim-lua/lsp-status.nvim")
	use({
		"neovim/nvim-lspconfig",
		requires = {
			"jose-elias-alvarez/nvim-lsp-ts-utils",
		},
	})
	use("bfredl/nvim-luadev")
	use({
		"hrsh7th/nvim-cmp",
		requires = {
			"hrsh7th/vim-vsnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lsp",
		},
	})
	use("saadparwaiz1/cmp_luasnip")
	use("L3MON4D3/LuaSnip")
	use("nvim-lua/plenary.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-telescope/telescope-fzy-native.nvim" },
			{ "nvim-telescope/telescope-dap.nvim" },
		},
	})
	use({
		"hoob3rt/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})
	use({
		"nvim-treesitter/nvim-treesitter",
		branch = "0.5-compat",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")
	use("kyazdani42/nvim-tree.lua")
	use("mhinz/vim-startify")
	use("kdheepak/lazygit.nvim")
	use("windwp/nvim-autopairs")
	use({
		"unisonweb/unison",
		branch = "trunk",
		rtp = "editor-support/vim",
	})
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({ "kristijanhusak/orgmode.nvim" })
	use({ "zah/nim.vim" })
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
		},
	})
end)

-- Plugin config
config("lsp")
config("treesitter")
config("nvim-cmp")
config("telescope")
config("lualine")
config("nvim-tree")
config("autopairs")
config("gitsigns")
config("orgmode")
