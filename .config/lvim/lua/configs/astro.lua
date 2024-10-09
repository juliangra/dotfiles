local opts = {
  init_options = {
    typescript = {
      tsdk = vim.fs.normalize('~/Library/pnpm/global/5/node_modules/typescript/lib')
    }
  },
}

require "lvim.lsp.manager".setup("astro", opts)
