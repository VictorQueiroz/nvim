-- Merged over the defaults nvim-lspconfig ships in its own lsp/lua_ls.lua, so
-- cmd/filetypes/root_markers are deliberately absent here.
--
-- runtime.version is NOT pinned. LuaLS defaults to Lua 5.4; the previous config
-- forced LuaJIT for every project that lacked a .luarc.json, which makes a plain
-- Lua 5.4 file report syntax errors on `//`, `&`, `|` and `~`. The three cases
-- resolve like this instead:
--
--   * Neovim config / plugin work -> lazydev injects LuaJIT and the vim runtime
--     library dynamically, only for the modules actually required.
--   * A project with a .luarc.json -> LuaLS reads it directly, and it outranks
--     everything set here.
--   * Anything else -> Lua 5.4, which is the right guess for plain Lua.
---@type vim.lsp.Config
return {
	settings = {
		Lua = {
			workspace = {
				-- Without this, LuaLS interrupts with "do you need to configure
				-- your work environment as LÖVE/OpenResty?" whenever it spots a
				-- third-party library.
				checkThirdParty = false,
			},
			completion = {
				callSnippet = "Replace",
			},
			hint = {
				enable = true,
				paramName = "Literal",
				paramType = true,
				arrayIndex = "Disable",
			},
			diagnostics = {
				-- Conventional throwaway names: `local _, err = pcall(...)`.
				unusedLocalExclude = { "_*" },
			},
		},
	},
}
