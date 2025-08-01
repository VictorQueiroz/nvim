-- Plugins related to AI-assisted development.
return {
	-- { "github/copilot.vim" },
	-- {
	-- 	"Exafunction/codeium.vim",
	-- },
	{
		"Exafunction/windsurf.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({
			})
		end
	},
}
