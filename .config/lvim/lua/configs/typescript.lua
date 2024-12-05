local lspconfig = require('lspconfig')



lspconfig.denols.setup {
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}

-- Do not setup tsserver by default
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "tsserver" })

local function is_deno_project()
  local cwd = vim.fn.getcwd()
  local deno_config = vim.fn.glob(cwd .. "/deno.json")
  local deno_configc = vim.fn.glob(cwd .. "/deno.jsonc")
  return deno_config ~= "" or deno_configc ~= ""
end
--
-- Conditionally setup tsserver
if not is_deno_project() then
  lspconfig.tsserver.setup {
    root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
  }
end
