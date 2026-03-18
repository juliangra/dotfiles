local formatters = require "lvim.lsp.null-ls.formatters"
local util = require("lspconfig.util")

local function contains_prettier_config()
  -- Check if go.mod exists in the project root
  return util.root_pattern({ ".prettierrc", ".prettierrc.js", ".prettierrc.json" })(vim.fn.expand('%:p:h'))
end

local function is_node_project()
  -- Check if package.json exists in the project root
  return util.root_pattern("package.json")(vim.fn.getcwd())
end

local function contains_biome_config()
  -- Check if biome config exists in the project root
  return util.root_pattern({ "biome.json" })(vim.fn.expand('%:p:h'))
end


formatters.setup {
  {
    command = "prettier",
    filetypes = { "typescript", "astro", "typescriptreact", "vue", "javascript", "javascriptreact", "css", "yaml",
      "html", "scss", "json", "markdown" },
    condition = function()
      return contains_prettier_config()
    end
  },
  {
    command = "rustfmt",
    filetypes = { "rust" },
  },
  {
    command = "biome",
    filetypes = { "typescript", "typescriptreact", "vue", "javascript", "javascriptreact" },
    condition = function()
      -- Only enable biome if it is a project containing a biome config
      return is_node_project() and contains_biome_config()
    end,
  },
  {
    command = "black",
    filetypes = { "python" },
  },
}
