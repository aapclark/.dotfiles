local map = vim.keymap.set

-- Terminal
map("t", "<ESC>", [[<C-\><C-n>]])
map("t", "jk", [[<C-\><C-n>]])

-- Window navigation
map("n", "<C-H>", "<C-W><C-H>")
map("n", "<C-J>", "<C-W><C-J>")
map("n", "<C-K>", "<C-W><C-K>")
map("n", "<C-L>", "<C-W><C-L>")

-- Editor
map("n", "<leader>nh", ":nohlsearch<CR>")
map("n", "<leader>tv", ":vnew | :te<CR>")

-- Quickfix
map("n", "<leader>fo", ":copen<CR>")
map("n", "<leader>fc", ":cclose<CR>")
map("n", "<leader>fn", ":cnext<CR>")
map("n", "<leader>fp", ":cprevious<CR>")

-- Diagnostics (border comes from vim.o.winborder, no need to repeat it here)
map("n", "<leader>d", vim.diagnostic.setloclist)
map("n", "]g", function() vim.diagnostic.jump({ count = 1, float = true }) end)
map("n", "[g", function() vim.diagnostic.jump({ count = -1, float = true }) end)

-- Telescope (lazy-require to avoid startup errors)
map("n", "<leader>ff", function() require("telescope.builtin").find_files() end)
map("n", "<leader>fg", function() require("telescope.builtin").git_files() end)
map("n", "<leader>fs", function() require("telescope.builtin").git_status() end)
map("n", "<leader>gst", function() require("telescope.builtin").git_status() end)
map("n", "<leader>fi", function() require("telescope.builtin").live_grep() end)
map("n", "<leader>bb", function() require("telescope.builtin").buffers() end)
map("n", "<leader>fb", function() require("telescope").extensions.file_browser.file_browser() end)

-- Glow
map("n", "<leader>gl", ":Glow<CR>")
