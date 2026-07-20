return {
	-- Theme picker. `livePreview` used to sit here as a top-level spec key, where
	-- lazy.nvim simply ignored it -- it is a Themery setup option, so it now
	-- lives in the setup call in config/plugins/10-style.lua.
	{
		"zaldih/themery.nvim",
		lazy = false,
	},
}
