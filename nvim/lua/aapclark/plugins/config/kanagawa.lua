local k = require("kanagawa")
local default = require("kanagawa.colors").setup()

local overrides = {
  TSError = { fg = default.autumnRed },
  StatusLine = { bg = default.winterBlue },
}

k.setup({
  commentStyle = { italic = true },
  overrides = overrides,
})

vim.cmd("colorscheme kanagawa")
