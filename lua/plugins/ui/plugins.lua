return {
	-- "skywind3000/vim-quickui" was removed: it is a menu/UI toolkit that does
	-- nothing until you define menus for it, and no menus were ever defined.

	-- VS Code-like winbar showing LSP context, via nvim-navic.
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},
}
