-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

reload "custom.keymaps"
reload "custom.plugins"
reload "plugins.nvim-cmp"
reload "plugins.htop"
reload "plugins.telescope"
reload "plugins.nvimtree"
reload "plugins.barbar"
reload "plugins.flutter"
reload "plugins.env"


--
--
--  ############################
--    General overridden config
--  ############################
--
--

-- Format on save
lvim.format_on_save = true


-- Set relative line numbers
vim.opt.relativenumber = true

-- Disable git for nvim-tree to avoid performance issues
lvim.builtin.nvimtree.setup.git.enable = false

-- Disable semantic tokens for all LSP servers (to correct)
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    client.server_capabilities.semanticTokensProvider = nil
  end,
});

--
--
--  ############################
--     Linters and formatters
--  ############################
--
--
reload 'configs.linters'
reload 'configs.formatters'


--  ############################
--    Fixed LSP configurations
--  ############################
reload "configs.volar"
reload "configs.tailwindcss"

--
--
--  ############################
--  Flutter related autocommands
--  ############################
--
--
reload 'configs.flutter'
