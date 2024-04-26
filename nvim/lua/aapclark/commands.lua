local cmd = vim.cmd

-- Commands
cmd([[autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o]])
cmd([[autocmd FileType markdown setlocal textwidth=80]])
cmd([[autocmd BufEnter *.js call matchadd('ColorColumn', '\%81v', 100)]])
cmd(
	[[autocmd BufReadPost,BufNewFile *.md,*.txt,COMMIT_EDITMSG set wrap linebreak nolist spell spelllang=en_us complete+=kspell]]
)
cmd([[autocmd BufReadPost,BufNewFile .html,*.txt,*.md,*.adoc set spell spelllang=en_us]])
cmd([[autocmd TermOpen * startinsert]])

-- Trim hanging whitespace
cmd([[au BufWritePre * %s/\s\+$//e]])


vim.api.nvim_create_augroup('custom', { clear = true })
-- Start Terminal In Insert Mode
vim.api.nvim_create_autocmd('TermOpen', {
	group = 'custom',
	pattern = '*',
	command = 'startinsert | set winfixheight'
})

-- Highlight Yanks
vim.api.nvim_create_autocmd('TextYankPost', {
	group = 'custom',
	pattern = '*',
	callback = function() vim.highlight.on_yank { timeout = 200 } end
})
