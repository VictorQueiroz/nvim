return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		}
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = {
			"rcarriga/nvim-notify",
			'nvim-lua/plenary.nvim'
		}
	},

	-- { "mbbill/undotree" },

	-- Integration for buffers
	{ "lewis6991/gitsigns.nvim" },

	-- The trashiest of neovim lua configs for the one and only trash_dev. 🗑
	-- { "ixahmedxi/trashvim" },

	-- This neovim plugin creates missing folders on save.
	{ "jghauser/mkdir.nvim" },
}
