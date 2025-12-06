return {
	-- LSP client manager
	{
		"mason-org/mason.nvim",
		dependencies = {
			"mason-org/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
	},

	{
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim"
    },
    opts = {
			lsp = { auto_attach = true }
		}
	},

	-- Nvim Treesitter configurations and abstraction layer
	{
		"nvim-treesitter/nvim-treesitter",
		highlight = {
			enable = true,
			disable = function(lang, buf)
				-- Disable for large files
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
		},
		incremental_selection = {
			enable = true,
		},
		indent = { enable = false },
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	}
}
