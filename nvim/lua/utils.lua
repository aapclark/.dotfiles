local M = {}

function _G.formatting()
    vim.lsp.buf.formatting(vim.g[string.format("format_options_%s", vim.bo.filetype)] or {})
end

function M.tt(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and M.tt "<C-n>" or M.tt "<Tab>"
end

function _G.smart_enter()
    return vim.fn.pumvisible() == 1 and M.tt "<C-y>" or M.tt "<CR>"
end
