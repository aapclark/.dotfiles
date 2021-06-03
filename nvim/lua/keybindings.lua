local g = vim.g
local f = require('helpers.functions')
local map = f.map

map('n', '<leader>n', [[<cmd>lua RELOAD('helpers.functions').toggle_nums()<CR>]])

map('n', '<C-H>', [[<C-W><C-H>]])
map('n', '<C-J>', [[<C-W><C-J>]])
map('n', '<C-K>', [[<C-W><C-K>]])
map('n', '<C-L>', [[<C-W><C-L>]])

map('n', '<leader>hs', ':nohlsearch<cr>')
map('n', '<leader>xml', ':%!xmllint --format -<cr>')
map('n', '<leader>fo', ':copen<cr>')
map('n', '<leader>fc', ':cclose<cr>')
map('n', '<leader>fn', ':cnext<cr>')
map('n', '<leader>fp', ':cprevious<cr>')
map('n', '<leader>tv', ':vnew | :te<cr>')

-- LSP
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
map('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>')
map('n', 'qf', '<cmd>lua vim.lsp.buf.code_action()<CR>')
map('n', '<leader>ll', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>')
map('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>')
map('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>')
map('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>')

map('n', '<leader>d', [[<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>]]) -- buffer diagnostics only
map('n', '<leader>ln', [[<cmd>lua vim.lsp.diagnostic.get_line_diagnostics()<CR>]])

-- telescope
map('n', '<leader>ff', [[<cmd>lua require'telescope.builtin'.find_files()<CR>]])
-- map('n', '<leader>lg', [[<cmd>lua require'telescope.builtin'.live_grep()<CR>]])
map('n', '<leader>fb', [[<cmd>lua require'telescope.builtin'.file_browser()<CR>]])

-- chadtree
map('n', '<leader>;', [[<cmd>NvimTreeToggle<cr>]])

-- completion
map('i', '<Enter>', [[v:lua.smart_enter()]], {expr = true, noremap = true})
map('i', '<Tab>', [[v:lua.smart_tab()]], {expr = true, noremap = true})

-- lazygit
map('n', '<leader>lg', [[<cmd>lua require'lazygit'.lazygit()<CR>]])
