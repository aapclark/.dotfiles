local k = require("kanagawa")
local colors = require("kanagawa.colors").setup({ theme = "wave" })

k.setup({
	commentStyle = { italic = true },
})

vim.cmd("colorscheme kanagawa")
