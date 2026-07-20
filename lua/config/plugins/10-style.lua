-- Theme picker. Every colorscheme listed here must have its plugin installed
-- in lua/plugins/style/00-colorschemes/plugins.lua, or selecting it will fail.
require("themery").setup({
  livePreview = true,
  themes = {
    {
      name = "Gruvbox dark",
      colorscheme = "gruvbox",
      before = [[
        vim.opt.background = "dark"
      ]],
    },
    {
      name = "Gruvbox light",
      colorscheme = "gruvbox",
      before = [[
        vim.opt.background = "light"
      ]],
    },
    {
      name = "Catppuccin Mocha",
      colorscheme = "catppuccin-mocha",
    },
    {
      name = "Catppuccin Latte",
      colorscheme = "catppuccin-latte",
    },
    {
      name = "VSCode",
      colorscheme = "vscode",
    },
    {
      name = "GitHub Colors",
      colorscheme = "github-colors",
    },
    {
      name = "GitHub Dark",
      colorscheme = "github_dark",
    },
    {
      name = "GitHub Dark Default",
      colorscheme = "github_dark_default",
    },
    {
      name = "GitHub Dark Dimmed",
      colorscheme = "github_dark_dimmed",
    },
    {
      name = "GitHub Light",
      colorscheme = "github_light",
    },
    {
      name = "GitHub Light Default",
      colorscheme = "github_light_default",
    },
  },
})
