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
	{ "folke/trouble.nvim" },
	{ "jubnzv/virtual-types.nvim" },
	{ "bfredl/nvim-luadev" },
	{ "hrsh7th/nvim-cmp" },
	{ "hrsh7th/cmp-buffer" },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "L3MON4D3/LuaSnip" },
	{ "nvim-telescope/telescope.nvim" },
	{ "nvim-lua/popup.nvim" },
	{ "nvim-telescope/telescope-fzy-native.nvim" },
	{ "nvim-telescope/telescope-dap.nvim" },
	{ "nvim-telescope/telescope-file-browser.nvim" },
	{ "strash/everybody-wants-that-line.nvim" },
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-treesitter/playground" },
	{ "goolord/alpha-nvim" },
	{ "windwp/nvim-autopairs" },
	-- { "lukas-reineke/indent-blankline.nvim" },
	{ "nmac427/guess-indent.nvim" },
	{ "lewis6991/gitsigns.nvim" },
	{ "nvim-lua/plenary.nvim" },
	{ "jose-elias-alvarez/null-ls.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ "jose-elias-alvarez/nvim-lsp-ts-utils" },
	{ "mvllow/modes.nvim" },
	{ "ellisonleao/glow.nvim" },
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},
	{ "williamboman/mason-lspconfig.nvim" },
}

require("lazy").setup(plugins)

config("kanagawa")
config("treesitter")
config("lsp")
config("lsp.mason")
config("nvim-cmp")
config("telescope")
config("autopairs")
config("gitsigns")
-- config("indent-blankline")
config("guess-indent")
config("alpha-nvim")
config("trouble")
config("modes")
config("that-line")