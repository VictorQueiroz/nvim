-- Options that must be set before lazy.nvim and any plugin loads.

-- Leaders have to be set before plugins define their keymaps, or the mappings
-- get bound against the old leader.
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Editor options still kept in Vimscript.
vim.cmd("source " .. vim.fn.stdpath("config") .. "/config.vim")

-- GUI font and line spacing (ignored by terminal Neovim).
vim.o.guifont = "Menlo:h12:#e-subpixelantialias:#h-slight"
vim.o.linespace = 1

-- EditorConfig support is built into Neovim; no plugin needed.
vim.g.editorconfig = true

-- Disable netrw, since nvim-tree is the file explorer.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
