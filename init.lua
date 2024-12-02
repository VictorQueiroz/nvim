-- Load previous Neovim configuration
vim.cmd('source ~/.config/nvim/config.vim')

-- Load plugin manager configuration
require("config.lazy")

-- 
require("hardtime").setup()

-- Enable EditorConfig
vim.g.editorconfig = true

-- Font family
-- vim.o.guifont = "Noto Sans Mono:h12:#e-subpixelantialias"
-- vim.o.guifont = "Menlo:h12:i:#e-subpixelantialias:#h-none"
vim.o.guifont = "Menlo:h12:#e-subpixelantialias:#h-slight"

-- Line spacing
vim.o.linespace = 1

-- filesystem.hijack_netrw_behavior = "open_current"

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
