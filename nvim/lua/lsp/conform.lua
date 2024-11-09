local c = require("conform")

c.setup({
  formatters_by_ft = {
    lua = { "stylua" },
    javascript = { { "prettierd", "prettier" } },
    typescript = { { "eslint_d", "prettierd", "prettier" } },
  },
  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  }
})
