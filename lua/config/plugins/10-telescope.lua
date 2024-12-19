local telescope = require('telescope')

-- Telescope with Async File Searching
telescope.setup({
	defaults = {
		file_ignore_patterns = { "node_modules", ".git/" },
	},
	-- pickers = {
	--   find_files = {
	--     theme = "dropdown",
	--   },
	-- },
})

telescope.load_extension("notify")
