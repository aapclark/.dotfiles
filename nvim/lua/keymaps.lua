local utils = require(".utils")

-- terminal escape
utils.tnoremap("<ESC>", [[<C-\><C-n>]])
utils.tnoremap("jk", [[<C-\><C-n>]])

utils.nnoremap("<C-H>", [[<C-W><C-H>]])
utils.nnoremap("<C-J>", [[<C-W><C-J>]])
utils.nnoremap("<C-K>", [[<C-W><C-K>]])
utils.nnoremap("<C-L>", [[<C-W><C-L>]])

utils.nnoremap("<leader>hs", ":nohlearch<cr>")
utils.nnoremap("<leader>fo", ":copen<cr>")
utils.nnoremap("<leader>fc", ":cclose<cr>")
utils.nnoremap("<leader>fn", ":cnext<cr>")
utils.nnoremap("<leader>fp", ":cprevious<cr>")
utils.nnoremap("<leader>tv", ":vnew | :te<cr>")

-- LSP
utils.snnoremap("<leader>ll", "<cmd>lua vim.diagnostic.setloclist()<CR>")
utils.snnoremap("]g", "<cmd>lua vim.diagnostic.goto_next({float = { border = 'single' }})<CR>")
utils.snnoremap("[g", "<cmd>lua vim.diagnostic.goto_prev({float = { border = 'single' }})<CR>")

utils.snnoremap("<leader>d", [[<cmd>lua vim.diagnostic.setloclist()<CR>]]) -- buffer diagnostics only
utils.snnoremap("<leader>ln", [[<cmd>lua vim.diagnostic.get()<CR>]])

-- telescope
utils.nnoremap("<leader>ff", [[<cmd>lua require'telescope.builtin'.find_files()<CR>]])
utils.nnoremap("<leader>fg", [[<cmd>lua require'telescope.builtin'.git_files()<CR>]])
utils.nnoremap("<leader>fs", [[<cmd>lua require'telescope.builtin'.git_status()<CR>]])
utils.nnoremap("<leader>fi", [[<cmd>lua require'telescope.builtin'.live_grep()<CR>]])
utils.nnoremap("<leader>gst", [[<cmd>lua require'telescope.builtin'.git_status()<CR>]])
utils.nnoremap("<leader>bb", [[<cmd>lua require'telescope.builtin'.buffers()<CR>]])
utils.nnoremap("<leader>fb", [[<cmd>lua require'telescope'.extensions.file_browser.file_browser()<CR>]])

-- completion
utils.iexnoremap("<Enter>", [[v:lua.smart_enter()]])
utils.iexnoremap("<Tab>", [[v:lua.smart_tab()]])

-- glow
utils.nnoremap("<leader>gl", ":Glow<CR>")
