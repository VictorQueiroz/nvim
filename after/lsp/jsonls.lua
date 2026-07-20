-- schemastore.nvim carries the SchemaStore catalogue, which is what gives
-- completion and validation inside package.json, tsconfig.json, and friends.
--
-- The require() runs when the config is resolved (the first time a JSON buffer
-- opens), not at startup, so schemastore is guaranteed to be on the runtimepath
-- by then.
---@type vim.lsp.Config
return {
	settings = {
		json = {
			schemas = require("schemastore").json.schemas(),
			validate = { enable = true },
		},
	},
}
