-- Load previous Neovim configuration
vim.cmd('source ~/.config/nvim/config.vim')

-- Load plugin manager configuration
require("config.lazy")

-- Load keymaps
require('config.keymapping')

require("hardtime").setup()

