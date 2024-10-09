local linters = require "lvim.lsp.null-ls.linters"

linters.setup {
  {
    command = "eslint",
    filetypes = { "typescript", "typescriptreact", "vue", "javascript", "javascriptreact" },
  },
  {
    command = "protolint",
    filetypes = { "proto" },
  }
}
