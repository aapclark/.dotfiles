local M = {}

local function map(mode, input, output, options)
  vim.api.nvim_set_keymap(mode, input, output, options)
end

local function noremap(mode, input, output)
  map(mode, input, output, { noremap = true })
end

local function snoremap(mode, input, output)
  noremap(mode, input, output, { silent = true })
end

M.map = map

M.nnoremap = function(input, output)
  noremap("n", input, output)
end

M.inoremap = function(input, output)
  noremap("i", input, output)
end

M.vnoremap = function(input, output)
  noremap("v", input, output)
end

M.tnoremap = function(input, output)
  noremap("t", input, output)
end

M.snnoremap = function(input, output)
  snoremap("n", input, output)
end

M.sinoremap = function(input, output)
  snoremap("i", input, output)
end

M.svnoremap = function(input, output)
  snoremap("v", input, output)
end

M.stnoremap = function(input, output)
  snoremap("t", input, output)
end

M.nmap = function(input, output)
  map("n", input, output)
end

M.imap = function(input, output)
  map("i", input, output)
end

M.vmap = function(input, output)
  map("v", input, output)
end

M.tmap = function(input, output)
  map("t", input, output)
end

M.iexnoremap = function(input, output)
  map("i", input, output, { expr = true, noremap = true })
end

local function opt(scope, key, value)
  local scopes = { o = vim.o, b = vim.bo, w = vim.wo }
  scopes[scope][key] = value
  if scope ~= "o" then
    scopes["o"][key] = value
  end
end

M.oopt = function(k, v)
  opt("o", k, v)
end

M.wopt = function(k, v)
  opt("w", k, v)
end

M.bopt = function(k, v)
  opt("b", k, v)
end

function _G.formatting()
  vim.lsp.buf.formatting(vim.g[string.format("format_options_%s", vim.bo.filetype)] or {})
end

function M.tt(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
  return vim.fn.pumvisible() == 1 and M.tt("<C-n>") or M.tt("<Tab>")
end

function _G.smart_enter()
  return vim.fn.pumvisible() == 1 and M.tt("<C-y>") or M.tt("<CR>")
end

M.config = function(name)
  return require(string.format("aapclark.plugins.%s", name))
end

M.attach_server_with = function(on_attach, capabilities)
  return function(server)
    M.config("lsp." .. server).setup({
        on_attach = on_attach,
        capabilities = capabilities,
    })
  end
end

return M
