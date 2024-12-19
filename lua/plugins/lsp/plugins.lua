return {
  -- LSP client manager
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
  },

  -- Code completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lua',

      -- Git source for nvim-cmp
      "petertriho/cmp-git",

      -- LSP source
      'hrsh7th/cmp-nvim-lsp',

      -- Buffer source
      'hrsh7th/cmp-buffer',

      -- Path source
      -- 'hrsh7th/cmp-path',

      -- nvim-cmp source for filesystem paths with async processing (neovim won't block while reading from disk).
      "FelipeLema/cmp-async-path",

      -- spell source for nvim-cmp based on vim's spellsuggest.
			'f3fora/cmp-spell',
    },
  },

  -- 💻 Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
	-- { "folke/neodev.nvim" },

  -- null-ls.nvim reloaded / Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  -- { "nvimtools/none-ls.nvim" },

  -- Check syntax in Vim/Neovim asynchronously and fix files, with Language Server Protocol (LSP) support
  -- { "dense-analysis/ale" },

  -- Better defaults for nvim-lsp actions.
  -- { "RishabhRD/nvim-lsputils" },

  -- NOTE: Makes no sense while mouse is disabled
  -- The plugin shows a lightbulb in the sign column whenever a textDocument/codeAction is available at the current cursor position.
  -- { "kosayoda/nvim-lightbulb" },

  -- IDE-like breadcrumbs, out of the box.
  -- { "Bekaboo/dropbar.nvim" },

  -- Resolve imports
  -- { "stevanmilic/nvim-lspimport" },

  -- Nvim Treesitter configurations and abstraction layer
  {
    "nvim-treesitter/nvim-treesitter",
    indent = { enable = false },
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },
}
