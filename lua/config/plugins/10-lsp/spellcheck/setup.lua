local vim = vim

vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"

vim.lsp.config.grammarly = {
  cmd = { 'grammarly-languageserver', '--stdio' },
}

vim.lsp.enable('grammarly')
