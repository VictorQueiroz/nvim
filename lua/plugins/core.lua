return {
	-- Removed from this file:
	--
	-- * "wfxr/minimap.vim" -- used `deps`, which is not a lazy.nvim key (it is
	--   `dependencies`), and its required `code-minimap` binary was never
	--   installed, so every launch printed "this plugin requires code-minimap
	--   installed".
	-- * "wfxr/csview" -- not a Neovim plugin at all. It is a Rust CLI crate, so
	--   lazy was cloning a Cargo project into the plugin directory for nothing.
	--   Install the binary with `cargo install csview` if you want it.
	-- * "Bilal2453/luvit-meta" -- deprecated; lazydev ships the luvit types now.

	-- A task runner and job management plugin for Neovim.
	{
		"stevearc/overseer.nvim",
		opts = {},
	},

	-- Configures LuaLS for editing your Neovim config by lazily updating the
	-- workspace libraries: it injects LuaJIT + the vim runtime types, but only for
	-- the modules a buffer actually requires.
	--
	-- The `enabled` guard below is what makes lua_ls usable in a NON-Neovim Lua
	-- project. Whenever lazydev is active it tells LuaLS the runtime is LuaJIT,
	-- which is only true of Neovim Lua. Left on everywhere, a plain Lua 5.4 file
	-- gets "LuaJIT does not support this grammar" on `//` and `&`. So lazydev is
	-- opt-in: a root has to actually look like Neovim config or a Neovim plugin.
	-- Everything else falls through to LuaLS's own default of Lua 5.4.
	{
		"folke/lazydev.nvim",
		ft = "lua",
		opts = {
			library = {
				-- vim.uv is luv, whose types are not part of the vim runtime.
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
			},
			enabled = function(root_dir)
				if vim.g.lazydev_enabled ~= nil then
					return vim.g.lazydev_enabled
				end

				-- A project that declares its own runtime outranks any guess made here.
				if
					vim.uv.fs_stat(root_dir .. "/.luarc.json")
					or vim.uv.fs_stat(root_dir .. "/.luarc.jsonc")
				then
					return false
				end

				-- The config itself, and any plugin installed under stdpath("data").
				for _, dir in ipairs({ vim.fn.stdpath("config"), vim.fn.stdpath("data") }) do
					if root_dir:sub(1, #dir) == dir then
						return true
					end
				end

				-- A Neovim/Vim plugin checked out anywhere else: these directories only
				-- mean something to a (Neo)vim runtime.
				for _, marker in ipairs({
					".nvim.lua",
					"lazy-lock.json",
					"plugin",
					"ftplugin",
					"colors",
					"syntax",
					"autoload",
				}) do
					if vim.uv.fs_stat(root_dir .. "/" .. marker) then
						return true
					end
				end

				return false
			end,
		},
	},
}
