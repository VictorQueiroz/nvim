
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

require("telescope").load_extension("notify")

require('config.nvim-tree')
