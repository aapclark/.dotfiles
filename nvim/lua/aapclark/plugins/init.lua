local config = require("aapclark.utils").config

local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap =
		fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
end

require("packer").startup(function(use)
	require("packer").init({
		git = {
			clone_timeout = false,
		},
	})
	use("wbthomason/packer.nvim")
	use("rebelot/kanagawa.nvim")
	use("junegunn/fzf")
	use("junegunn/fzf.vim")
	use("b3nj5m1n/kommentary")
	use("nvim-lua/lsp-status.nvim")
	use("neovim/nvim-lspconfig")
	use("folke/trouble.nvim")
	use("jubnzv/virtual-types.nvim")
	use("bfredl/nvim-luadev")
	use({
		"hrsh7th/nvim-cmp",
		requires = {
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
			{ "nvim-telescope/telescope-file-browser.nvim" },
		},
	})
	use("strash/everybody-wants-that-line.nvim")
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("nvim-treesitter/playground")
	use({ "goolord/alpha-nvim", requires = {
		"kyazdani42/nvim-web-devicons",
	} })
	use("windwp/nvim-autopairs")
	use("lukas-reineke/indent-blankline.nvim")
	use({
		"lewis6991/gitsigns.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	use({ "alaviss/nim.nvim" })
	use({
		"jose-elias-alvarez/null-ls.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
			"neovim/nvim-lspconfig",
			"jose-elias-alvarez/nvim-lsp-ts-utils",
		},
	})
	use("mvllow/modes.nvim")
	use({ "ellisonleao/glow.nvim", branch = "main" })
end)

config("kanagawa")
config("treesitter")
config("lsp")
config("nvim-cmp")
config("telescope")
config("autopairs")
config("gitsigns")
config("indent-blankline")
config("alpha-nvim")
config("trouble")
config("modes")
config("that-line")
