require("lualine").setup({
	options = {
    icons_enabled = false,
		globalstatus = true,
	},
    sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    -- lualine_x = {'location','progress','filetype'},
    lualine_x = {},
    lualine_y = {},
    lualin_z = {},
  },
	extensions = {},
})
