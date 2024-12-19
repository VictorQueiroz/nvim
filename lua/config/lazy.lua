-- Point to Neovim virtual environment
vim.g.python3_host_prog = os.getenv('HOME') .. '/.pyenv/versions/neovim/bin/python3'

-- Get absolute path of lua directory
local lua_root_dir = vim.fn.stdpath("config") .. "/lua"

local recursive_load_plugins = require('core.recursive_load_plugins')

local preload_files = recursive_load_plugins(lua_root_dir, "config/preload")

-- Load preload configuration files before Lazy is initialized
for _, plugin_spec in ipairs(preload_files) do
	-- print(plugin_spec.import)
	require(plugin_spec.import)
end


-- Bootstrap lazy.nvim; fetch it from GitHub if it doesn't exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

local function nodejs_ensure_globally_installed_packages(packages)
	for _, package in ipairs(packages) do
		local is_package_installed = vim.fn.system({ 'npm', 'ls', '-g', package })
		if vim.v.shell_error ~= 0 then
			print("Installing " .. package .. " globally...")
			vim.fn.system({ 'npm', 'install', '-g', package })
		end
	end
end

nodejs_ensure_globally_installed_packages({ "neovim" })

-- Example usage: load all plugin specs from the 'plugins' directory and its subdirectories
local plugins = recursive_load_plugins(lua_root_dir, "plugins")

-- Setup lazy.nvim
require("lazy").setup({
	defaults = {
		lazy = false,
		version = nil,
		cond = nil
	},
	pkg = {
		enabled = true,
		cache = vim.fn.stdpath("state") .. "/lazy/pkg-cache.lua",
		-- the first package source that is found for a plugin will be used.
		sources = {
			"lazy",
			"rockspec", -- will only be used when rocks.enabled is true
			"packspec",
		},
	},
	rocks = {
		enabled = true,
		root = vim.fn.stdpath("data") .. "/lazy-rocks",
		server = "https://nvim-neorocks.github.io/rocks-binaries/",
		-- use hererocks to install luarocks?
		-- set to `nil` to use hererocks when luarocks is not found
		-- set to `true` to always use hererocks
		-- set to `false` to always use luarocks
		hererocks = nil,
	},
	spec = plugins,
	diff = {
		-- diff command <d> can be one of:
		-- * browser: opens the github compare view. Note that this is always mapped to <K> as well,
		--   so you can have a different command for diff <d>
		-- * git: will run git diff and open a buffer with filetype git
		-- * terminal_git: will open a pseudo terminal with git diff
		-- * diffview.nvim: will open Diffview to show the diff
		cmd = "git",
	},
	-- Output options for headless mode
	headless = {
		-- show the output from process commands like git
		process = true,
		-- show log messages
		log = true,
		-- show task start/end
		task = true,
		-- use ansi colors
		colors = true,
	},
	install = {
		-- install missing plugins on startup. This doesn't increase startup time.
		missing = true,
		-- try to load one of these colorschemes when starting an installation during startup
		colorscheme = { "habamax" },
	},

	checker = {
		-- automatically check for plugin updates
		enabled = false,
		concurrency = nil, ---@type number? set to 1 to check for updates very slowly
		notify = true, -- get a notification when new updates are found
		frequency = 3600, -- check for updates every hour
		check_pinned = false, -- check for pinned packages that can't be updated
	},

	change_detection = {
		-- automatically check for config file changes and reload the ui
		enabled = true,
		notify = true, -- get a notification when changes are found
	},

	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true, -- reset the package path to improve startup time
		rtp = {
			reset = true, -- reset the runtime path to $VIMRUNTIME and your config directory
			---@type string[]
			paths = {}, -- add any custom paths here that you want to includes in the rtp
			---@type string[] list any plugins you want to disable here
			disabled_plugins = {
				-- "gzip",
				-- "matchit",
				-- "matchparen",
				-- "netrwPlugin",
				-- "tarPlugin",
				-- "tohtml",
				-- "tutor",
				-- "zipPlugin",
			},
		},
	},
	ui = {
		-- a number <1 is a percentage., >1 is a fixed size
		size = { width = 0.8, height = 0.8 },
		wrap = true, -- wrap the lines in the ui
		-- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
		border = "none",
		-- The backdrop opacity. 0 is fully opaque, 100 is fully transparent.
		backdrop = 60,
		title = nil, ---@type string only works when border is not "none"
		title_pos = "center", ---@type "center" | "left" | "right"
		-- Show pills on top of the Lazy window
		pills = true, ---@type boolean
		icons = {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
		-- leave nil, to automatically select a browser depending on your OS.
		-- If you want to use a specific browser, you can define it here
		browser = nil, ---@type string?
		throttle = 1000 / 60, -- how frequently should the ui process render events
		-- custom_keys = {
		--   -- You can define custom key maps here. If present, the description will
		--   -- be shown in the help menu.
		--   -- To disable one of the defaults, set it to false.

		--   ["<localleader>l"] = {
		--     function(plugin)
		--       require("lazy.util").float_term({ "lazygit", "log" }, {
		--         cwd = plugin.dir,
		--       })
		--     end,
		--     desc = "Open lazygit log",
		--   },

		--   ["<localleader>i"] = {
		--     function(plugin)
		--       Util.notify(vim.inspect(plugin), {
		--         title = "Inspect " .. plugin.name,
		--         lang = "lua",
		--       })
		--     end,
		--     desc = "Inspect Plugin",
		--   },

		--   ["<localleader>t"] = {
		--     function(plugin)
		--       require("lazy.util").float_term(nil, {
		--         cwd = plugin.dir,
		--       })
		--     end,
		--     desc = "Open terminal in plugin dir",
		--   },
		-- },
	},

	-- lazy can generate helptags from the headings in markdown readme files,
	-- so :help works even for plugins that don't have vim docs.
	-- when the readme opens with :help it will be correctly displayed as markdown
	readme = {
		enabled = true,
		root = vim.fn.stdpath("state") .. "/lazy/readme",
		files = { "README.md", "lua/**/README.md" },
		-- only generate markdown helptags for plugins that don't have docs
		skip_if_doc_exists = true,
	},
})

local plugin_configuration_files = recursive_load_plugins(lua_root_dir, "config/plugins")

-- Load all configuration files
for _, plugin_spec in ipairs(plugin_configuration_files) do
	-- print(plugin_spec.import)
	require(plugin_spec.import)
end
