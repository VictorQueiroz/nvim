-- Load previous Neovim configuration
vim.cmd('source ~/.config/nvim/config.vim')

-- Load plugin manager configuration
require("config.lazy")

-- Load keymaps
require('config.keymapping')

-- Setup mason
require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "html",
    "lua_ls",
    "pyright",
    -- "gopls",
    "ts_ls",
  }
})

require("hardtime").setup()
