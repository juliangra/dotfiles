local linters = require "lvim.lsp.null-ls.linters"
local util = require("lspconfig.util")

local function is_node_project()
  -- Check if package.json exists in the project root
  return util.root_pattern("package.json")(vim.fn.getcwd())
end

local function contains_eslint_config()
  -- Check if go.mod exists in the project root
  return util.root_pattern({ ".eslintrc", ".eslintrc.js", ".eslintrc.json", "eslint.config.js" })(vim.fn.expand('%:p:h'))
end

linters.setup {
  {
    command = "eslint",
    filetypes = { "typescript", "typescriptreact", "vue", "javascript", "javascriptreact" },
    condition = function()
      -- Only enable eslint if it is a node project
      return is_node_project() and contains_eslint_config()
    end,
  },
  {
    command = "protolint",
    filetypes = { "proto" },
  },
}
