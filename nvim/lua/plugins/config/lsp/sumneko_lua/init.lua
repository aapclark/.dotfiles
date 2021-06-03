local lsp = require "lspconfig"
USER = vim.fn.expand('$USER')

local M = {}

local sumneko_root_path = '/Users/' .. USER .. "/lua-language-server"
local sumneko_binary = '/Users/' .. USER .. "/lua-language-server/bin/MacOS/lua-language-server"

local function get_lua_runtime()
    local result = {}
    for _, path in pairs(vim.api.nvim_list_runtime_paths()) do
        local lua_path = path .. "/lua/"
        if vim.fn.isdirectory(lua_path) then
            result[lua_path] = true
        end
    end
    result[vim.fn.expand("$VIMRUNTIME/lua")] = true
    result[vim.fn.expand("~/build/neovim/src/nvim/lua")] = true

    return result
end

function M.setup(lsp_opts)
    lsp.sumneko_lua.setup {
        on_attach = function(client)
            lsp_opts.on_attach(client)
        end,
        capabilities = lsp_opts.capabilities,
        cmd = {
            sumneko_binary,
            "-E",
            sumneko_root_path .. "/main.lua"
        },
        settings = {
            Lua = {
                runtime = {
                    version = "LuaJIT",
                },
                diagnostics = {
                    enable = true,
                    globals = {
                        "vim"
                    },
                },
                workspace = {
                    library = get_lua_runtime(),
                    maxPreload = 1000,
                    preloadFileSize = 1000,
                }
            }
        }
    }
end

return M
