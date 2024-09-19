-- Detect all .env.* files as shell scripts
vim.cmd([[
  augroup EnvFileType
    autocmd!
    autocmd BufRead,BufNewFile .env.* set filetype=sh
  augroup END
]])
