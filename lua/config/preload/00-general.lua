-- Load previous Neovim configuration
vim.cmd('source ~/.config/nvim/config.vim')

-- Font family
-- vim.o.guifont = "Noto Sans Mono:h12:#e-subpixelantialias"
-- vim.o.guifont = "Menlo:h12:i:#e-subpixelantialias:#h-none"
vim.o.guifont = "Menlo:h12:#e-subpixelantialias:#h-slight"

-- Line spacing
vim.o.linespace = 1

-- filesystem.hijack_netrw_behavior = "open_current"

-- Enable EditorConfig
vim.g.editorconfig = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.codeium_disable_bindings = 1
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true
