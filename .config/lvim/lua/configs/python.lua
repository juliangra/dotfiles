-- Do not setup `pyright` LSP server by default
vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
--
-- remove `jedi_language_server` from `skipped_servers` list
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return server ~= "jedi_language_server"
end, lvim.lsp.automatic_configuration.skipped_servers)
