-- Set the preferred color scheme for Neovim
-- vim.cmd('colorscheme catppuccin-mocha')
-- vim.cmd('colorscheme xresources')
-- vim.cmd('colorscheme catppuccin-latte')
-- vim.cmd('colorscheme catppuccin-frappe')
-- vim.cmd('colorscheme catppuccin-macchiato')
-- vim.cmd('colorscheme vscode')

-- vim.cmd('colorscheme github_light')

require("themery").setup({
  themes = {
  	{
	    name = "Gruvbox dark",
	    colorscheme = "gruvbox",
	    before = [[
	      -- All this block will be executed before apply "set colorscheme"
	      vim.opt.background = "dark"
	    ]],
	  },
	  {
	    name = "Gruvbox light",
	    colorscheme = "gruvbox",
	    before = [[
	      vim.opt.background = "light"
	    ]],
	    after = [[-- Same as before, but after if you need it]]
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
	  }
	},
})
