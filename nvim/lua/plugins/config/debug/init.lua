require('telescope').load_extension('dap')
require('plugins.config.debug.node')

vim.g.dap_virtual_text = true
vim.g.ultest_use_pty = true

local f = require('helpers.functions')

f.n_map('n', '<leader>dct', '<cmd>lua require"dap".continue()<CR>')
f.n_map('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>')
f.n_map('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>')
f.n_map('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>')
f.n_map('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>')

f.n_map('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>')
f.n_map('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>')
f.n_map('v', '<leader>dhv',
    '<cmd>lua require"dap.ui.variables".visual_hover()<CR>')

f.n_map('n', '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>')
f.n_map('n', '<leader>duf',
    "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>")

f.n_map('n', '<leader>dsbr',
    '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>')
f.n_map('n', '<leader>dsbm',
    '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>')
f.n_map('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>')
f.n_map('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>')


-- telescope-dap
f.n_map('n', '<leader>dcc',
    '<cmd>lua require"telescope".extensions.dap.commands{}<CR>')
f.n_map('n', '<leader>dco',
    '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>')
f.n_map('n', '<leader>dlb',
    '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>')
f.n_map('n', '<leader>dv',
    '<cmd>lua require"telescope".extensions.dap.variables{}<CR>')
f.n_map('n', '<leader>df',
    '<cmd>lua require"telescope".extensions.dap.frames{}<CR>')

f.n_map('n', '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>')

