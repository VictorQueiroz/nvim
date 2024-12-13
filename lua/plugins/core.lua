return {
	-- 📡 Blazing fast minimap / scrollbar for vim, powered by code-minimap written in Rust.
	{
		"wfxr/minimap.vim",
	  deps = { "wfxr/code-minimap" }
	},
	-- 📠 Pretty and fast csv viewer for cli with cjk/emoji support.
	{ "wfxr/csview" },
	-- A task runner and job management plugin for Neovim
	{
		"stevearc/overseer.nvim",
		opts = {},
	},
	-- lazydev.nvim is a plugin that properly configures LuaLS for editing your Neovim config by lazily updating your workspace libraries.
	{
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
	
	-- `vim.uv` typings
  { "Bilal2453/luvit-meta", lazy = true },
}

