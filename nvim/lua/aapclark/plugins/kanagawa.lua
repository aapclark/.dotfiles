local k = require("kanagawa")
-- local default = require("kanagawa.colors").setup()

local overrides = {
	-- tserror = { fg = default.autumnred },
	-- StatusLine = { bg = default.winterBlue },
}

k.setup({
	commentStyle = { italic = true },
	-- overrides = overrides,
	-- theme = 'lotus'
})

vim.cmd("colorscheme kanagawa")
