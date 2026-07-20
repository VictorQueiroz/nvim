-- Python is split across two servers: basedpyright owns types, hover and
-- completion; ruff owns linting, formatting and import sorting. See
-- lua/config/plugins/10-lsp/setup.lua, which turns off ruff's hover so the two do
-- not race to answer it.
---@type vim.lsp.Config
return {
	settings = {
		basedpyright = {
			-- Ruff's organizer is the one we want; leaving this on means every
			-- Python buffer offers two competing "organize imports" code actions.
			disableOrganizeImports = true,
			analysis = {
				-- basedpyright defaults to "recommended", which turns every rule on
				-- and buries an existing untyped codebase in warnings. "standard"
				-- matches what stock pyright reports.
				typeCheckingMode = "standard",
				diagnosticMode = "openFilesOnly",
				inlayHints = {
					variableTypes = true,
					callArgumentNames = true,
					functionReturnTypes = true,
					-- Noisy on anything heavily generic, and rarely the thing you
					-- actually wanted to know.
					genericTypes = false,
				},
			},
		},
	},
}
