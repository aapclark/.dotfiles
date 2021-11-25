local g = vim.g
local utils = require("aapclark.utils")

-- terminal escape
utils.tnoremap("<ESC>", [[<C-\><C-n>]])
utils.tnoremap("jk", [[<C-\><C-n>]])

utils.nnoremap("<C-H>", [[<C-W><C-H>]])
utils.nnoremap("<C-J>", [[<C-W><C-J>]])
utils.nnoremap("<C-K>", [[<C-W><C-K>]])
utils.nnoremap("<C-L>", [[<C-W><C-L>]])

utils.nnoremap("<leader>hs", ":nohlsearch<cr>")
utils.nnoremap("<leader>xml", ":%!xmllint --format -<cr>")
utils.nnoremap("<leader>fo", ":copen<cr>")
utils.nnoremap("<leader>fc", ":cclose<cr>")
utils.nnoremap("<leader>fn", ":cnext<cr>")
utils.nnoremap("<leader>fp", ":cprevious<cr>")
utils.nnoremap("<leader>tv", ":vnew | :te<cr>")

-- LSP
utils.snnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
utils.snnoremap("gf", "<cmd>lua vim.lsp.buf.formatting()<CR>")
utils.snnoremap("gr", "<cmd>lua vim.lsp.buf.references()<CR>")
utils.snnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
utils.snnoremap("qf", "<cmd>lua vim.lsp.buf.code_action()<CR>")
utils.snnoremap("<leader>ll", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
utils.snnoremap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
utils.snnoremap("]g", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
utils.snnoremap("[g", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")

utils.snnoremap("<leader>d", [[<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>]]) -- buffer diagnostics only
utils.snnoremap("<leader>ln", [[<cmd>lua vim.lsp.diagnostic.get_line_diagnostics()<CR>]])

-- telescope
utils.nnoremap("<leader>ff", [[<cmd>lua require'telescope.builtin'.find_files()<CR>]])
utils.nnoremap("<leader>fg", [[<cmd>lua require'telescope.builtin'.git_files()<CR>]])
-- utils.nnoremap('<leader>lg', [[<cmd>lua require'telescope.builtin'.live_grep()<CR>]])
utils.nnoremap("<leader>fb", [[<cmd>lua require'telescope.builtin'.file_browser()<CR>]])

-- chadtree
utils.nnoremap("<leader>;", [[<cmd>NvimTreeToggle<cr>]])

-- completion
utils.iexnoremap("<Enter>", [[v:lua.smart_enter()]])
utils.iexnoremap("<Tab>", [[v:lua.smart_tab()]])

-- lazygit
utils.nnoremap("<leader>lg", [[<cmd>lua require'lazygit'.lazygit()<CR>]])