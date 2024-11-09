local config = function(name)
	return require(string.format("plugins.%s", name))
end

config("catppuccin")
config("treesitter")
config("nvim-cmp")
config("telescope")
config("autopairs")
config("gitsigns")
config("guess-indent")
config("alpha-nvim")
config("trouble")
config("modes")
config("mini-statusline")
