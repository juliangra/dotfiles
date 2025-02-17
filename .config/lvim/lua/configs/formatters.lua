local formatters = require "lvim.lsp.null-ls.formatters"
local util = require("lspconfig.util")

local function contains_eslint_config()
  -- Check if go.mod exists in the project root
  return util.root_pattern({ ".prettierrc", ".prettierrc.js", ".prettierrc.json" })(vim.fn.expand('%:p:h'))
end


formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript", "astro", "typescriptreact", "vue", "javascript", "javascriptreact", "css", "yaml",
      "html", "scss", "json", "markdown" },
    -- condition = contains_eslint_config,
  },
  {
    command = "rustfmt",
    filetypes = { "rust" },
  },
  {
    command = "black",
    filetypes = { "python" },
  },
}
