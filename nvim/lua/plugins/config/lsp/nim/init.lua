local lsp = require "lspconfig"

local M = {}

function M.setup(lsp_opts)
    lsp.nimls.setup(
        {
            on_attach = function(client)
                lsp_opts.on_attach(client)
            end,
            capabilities = lsp_opts.capabilities,
            cmd = {"nimlsp"},
            filetypes = {"nim"},
            root_dir = lsp.util.root_pattern(".git")
        }
    )
end

return M
