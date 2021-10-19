local ok, null_ls = pcall(require, "null-ls")
local lc = require "lspconfig"

if not ok then
    return
end

local b = null_ls.builtins

local sources = {
    -- JS html css stuff
    b.formatting.prettierd.with {
        filetypes = {
            "html",
            "json",
            "markdown",
            "css",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "graphql"
        }
    },
    b.diagnostics.eslint.with {
        command = "eslint_d"
    },
    -- Lua
    b.formatting.stylua,
    b.diagnostics.luacheck.with {
        extra_args = {"--global vim"}
    },
    -- Shell
    b.formatting.shfmt,
    b.diagnostics.shellcheck.with {diagnostics_format = "#{m} [#{c}]"},
    -- Dockerfile
    b.diagnostics.hadolint,
    -- Prisma
    b.formatting.prismaFmt
}

local M = {}

M.setup = function()
    null_ls.config {
        sources = sources
    }
    lc["null-ls"].setup {
        on_attach = function(client)
            require("lsp.utils").fmt_on_save(client)
        end
    }
end

return M
