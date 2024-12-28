local telescope = require('telescope')

-- Telescope with Async File Searching
telescope.setup({
	defaults = {
	  file_ignore_patterns = { "node_modules", ".git/" }, -- Ignore heavy directories
	  layout_strategy = 'horizontal',
	  layout_config = {
	    preview_width = 0.5, -- Reduce preview size
	  },
	  vimgrep_arguments = {
	    'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case',
	  },
	  path_display = { "truncate" },
	  sorting_strategy = "ascending",
	  scroll_strategy = "cycle",
	},	
	-- defaults = {
	-- 	file_ignore_patterns = { "node_modules", ".git/" },
	-- },
	-- pickers = {
	--   find_files = {
	--     theme = "dropdown",
	--   },
	-- },
})

telescope.load_extension("notify")
