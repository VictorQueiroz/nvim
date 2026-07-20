return {
	{ "wakatime/vim-wakatime", lazy = false },

	-- Pretty list for diagnostics, references, quickfix and location lists.
	-- Needs `opts` -- it has no plugin/ directory, so without this lazy never
	-- calls setup() and the :Trouble command does not exist.
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Trouble",
		opts = {},
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
			{ "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Quickfix List (Trouble)" },
		},
	},
}
