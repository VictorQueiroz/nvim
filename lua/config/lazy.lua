-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
    { import = "plugins.core" },
    { import = "plugins.ui" },
    { import = "plugins.notification" },
    { import = "plugins.navigation" },
    { import = "plugins.shell" },
    { import = "plugins.peripheral" },

    -- Spell checking
    { import = "plugins.spellcheck" },

    -- Diagnostics
    { import = "plugins.diagnostics" },

    -- Debugging
    { import = "plugins.debugging" },

    -- Style
    { import = "plugins.style" },
    { import = "plugins.style.plugins" },
    { import = "plugins.style.themes" },

    -- LSP
    { import = "plugins.lsp" },
    { import = "plugins.lsp.autocomplete" },
    { import = "plugins.lsp.languages.java" },
    { import = "plugins.lsp.syntax" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  -- install = { colorscheme = { "nightfox" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

require('config.lsp.setup')
require('config.explorer.setup')
require('config.vcs.setup')
require('config.clipboard')
require('config.filesystem')
require('config.style')
require('config.keymapping')
require('config.copilot.setup')
