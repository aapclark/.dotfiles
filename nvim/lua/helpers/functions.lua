local api = vim.api

local function opt(scope, key, value)
  local scopes = { o = vim.o, b = vim.bo, w = vim.wo }
  scopes[scope][key] = value
  if scope ~= "o" then
    scopes["o"][key] = value
  end
end

local function map(mode, lhs, rhs, opts)
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function toggle_nums()
  opt("w", "number", not vim.wo.number)
end

-- Buffer local keymap
local function buf_map(...)
  vim.api.nvim_buf_set_keymap(bufnr, ...)
end

-- Buffer local option
local function buf_option(...)
  vim.api.nvim_buf_set_option(bufnr, ...)
end

return {
  opt = opt,
  map = map,
  toggle_nums = toggle_nums,
  buf_map = buf_map,
  buf_option = buf_option,
}
