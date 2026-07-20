return {
	-- "gpanders/editorconfig.nvim" was removed: it is archived upstream, and
	-- EditorConfig support is built into Neovim (>= 0.9). It is already switched
	-- on via `vim.g.editorconfig = true` in config/preload/00-general.lua.

	-- Smart and powerful comment plugin. Supports treesitter, dot repeat,
	-- left-right/up-down motions, hooks, and more.
	{
		"numToStr/Comment.nvim",
		opts = {},
	},

	-- Add/change/delete surrounding delimiter pairs with ease.
	{
		"kylechui/nvim-surround",
		opts = {},
	},
}
