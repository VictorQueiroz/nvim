-- Setup mason
-- require("mason").setup()
-- require("mason-lspconfig").setup({
--   ensure_installed = {
--     "html",
--     "lua_ls",
--     "pyright",
--     -- "gopls",
--     "ts_ls",
--     "bashls",
--     "jsonls",
--     "yamlls",
--   }
-- })

require('config.lsp.bash.setup')
require('config.lsp.lua.setup')
require('config.lsp.spellcheck.setup')

