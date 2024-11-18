local vim = vim

vim.opt_local.spell = true
vim.opt_local.spelllang = "en_us"

-- local grammarly = require('lspconfig').grammarly
-- 
-- grammarly.setup({
--   cmd = { 'grammarly-languageserver', '--stdio' },
--   filetypes = { 'markdown' },
--   root_dir = util.find_git_ancestor,
--   single_file_support = true,
--   handlers = {
--     ['$/updateDocumentState'] = function()
--       return ''
--     end,
--   },
--   init_options = {
--     clientId = 'client_BaDkMgx4X19X9UxxYRCXZo',
--   },
-- })
