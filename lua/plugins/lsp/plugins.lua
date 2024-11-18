return {
  -- 💻 Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
  { "folke/neodev.nvim" },

  -- null-ls.nvim reloaded / Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  { "nvimtools/none-ls.nvim" },

  -- Check syntax in Vim/Neovim asynchronously and fix files, with Language Server Protocol (LSP) support
  { "dense-analysis/ale" },

  -- Better defaults for nvim-lsp actions.
  { "RishabhRD/nvim-lsputils" },

  -- The plugin shows a lightbulb in the sign column whenever a textDocument/codeAction is available at the current cursor position.
  { "kosayoda/nvim-lightbulb" },

  -- LSP signature hint when you type.
  -- { "ray-x/lsp_signature.nvim" },
  -- Previewing native LSP's goto definition calls in floating windows.
  -- { "rmagatti/goto-preview" },
  -- Provide inline virtual text displaying TypeScript types for the inspected variables.
  -- { "marilari88/twoslash-queries.nvim" },
  -- A significantly enhanced and refactored fork of `symbols-outline.nvim`.
  -- { "hedyhli/outline.nvim" },
  -- A simple popup display that provides breadcrumbs like navigation features using LSP.
  -- { "SmiteshP/nvim-navbuddy" },
  -- Neovim's missing IDE features.
  -- { "ldelossa/litee.nvim" },
  -- Standalone UI for LSP progress.
  -- { "j-hui/fidget.nvim" },
  -- Neovim plugin for Metals, the Scala language server, using Neovim's builtin LSP.
  -- { "scalameta/nvim-metals" },
  -- Display LSP hover documentation in a side panel.
  -- { "amrbashir/nvim-docs-view" },
  -- Inline diagnostics popup-highlight much like coc-nvim but based on vim.diagnostic.
  -- { "Kasama/nvim-custom-diagnostic-highlight" },
  -- Neovim plugin for ccls language server. Leverages off-spec extensions to LSP client with AST browser support.
  -- { "ranjithshegde/ccls.nvim" },
  -- A completion plugin for neovim coded in Lua.
  -- { "hrsh7th/nvim-cmp" },
  --  Tiny plugin to quickly switch Python virtual environments without restarting.
  -- { "AckslD/swenv.nvim" },
  -- Asynchronous project-wide TypeScript type-checking using the TypeScript compiler (TSC) with results loaded into a quickfix list.
  -- { "dmmulroy/tsc.nvim" },
  -- Switch Python interpreter without restarting LSP.
  -- { "neolooong/whichpy.nvim" },
  -- A fast Neovim HTTP client written in Lua.
  -- { "rest-nvim/rest.nvim" },
  -- Bookmarks with global file storage, written in Lua.
  -- { "tomasky/bookmarks.nvim" },
  -- LSP client manager
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
  },

  -- A plugin that highlights cursor words and lines.
  {
    "yamatsum/nvim-cursorline",
    dependencies = {
      -- Part of nvim-cursorline. Highlight the word under the cursor.
      { "xiyaowong/nvim-cursorword" },
    },
  },

  -- Null-ls.nvim reloaded / Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
  { "nvimtools/none-ls.nvim" },

  -- IDE-like breadcrumbs, out of the box.
  { "Bekaboo/dropbar.nvim" },

  -- Resolve imports
  { "stevanmilic/nvim-lspimport" },

  -- Code completion
--  {
--    'hrsh7th/nvim-cmp',
--    dependencies = {
--      'hrsh7th/cmp-nvim-lsp',       -- LSP source
--      'hrsh7th/cmp-buffer',         -- Buffer source
--      'hrsh7th/cmp-path',           -- Path source
--      'saadparwaiz1/cmp_luasnip',   -- Snippet source
--      'L3MON4D3/LuaSnip',           -- Snippet engine
--    },
--  },

  -- Nvim Treesitter configurations and abstraction layer
  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },
}
