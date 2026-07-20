-- Colorschemes.
--
-- Only themes actually reachable from the Themery picker are installed here
-- (see lua/config/plugins/10-style.lua). This list previously carried ~110
-- entries, 44 of them duplicates, plus two repos that no longer exist on
-- GitHub (novakne/kosmikoa.nvim, MordechaiHadad/nvim-papadark) -- lazy.nvim
-- retried cloning those on every launch, costing ~3.9s of startup.
--
-- To add a theme: add the repo here AND an entry in the Themery config.
return {
  -- Lua port of the most famous vim colorscheme.
  { "ellisonleao/gruvbox.nvim" },

  -- A Lua port of vim-code-dark, with VSCode light and dark themes.
  { "Mofiqul/vscode.nvim" },

  -- GitHub colors leveraging Tree-sitter to get 100% accuracy.
  { "lourenci/github-colors" },

  -- GitHub themes (dark, dark_default, dark_dimmed, light, light_default).
  { "projekt0n/github-nvim-theme" },

  -- Warm mid-tone theme with support for native LSP and Tree-sitter.
  { "catppuccin/nvim", name = "catppuccin" },
}
