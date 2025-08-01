return {
	-- EditorConfig integration
	{ "gpanders/editorconfig.nvim" },

	-- Prettier integration
	-- { "prettier/vim-prettier" },

	-- Indent guides for Neovim
	-- { "lukas-reineke/indent-blankline.nvim" },

	-- 🧠 💪 // Smart and powerful comment plugin for neovim. Supports treesitter, dot repeat, left-right/up-down motions, hooks, and more.
	{
		"numToStr/Comment.nvim",
		config = function()
        require('Comment').setup()
    end
  },

	-- Add/change/delete surrounding delimiter pairs with ease. Written with ❤️ in Lua.
	{"kylechui/nvim-surround"},
}
