-- vtsls wraps the same TypeScript extension VS Code ships, so it takes VS Code's
-- `typescript.*` / `javascript.*` settings verbatim, plus its own `vtsls.*`.
local inlay_hints = {
	parameterNames = { enabled = "literals" },
	parameterTypes = { enabled = true },
	variableTypes = { enabled = true },
	propertyDeclarationTypes = { enabled = true },
	functionLikeReturnTypes = { enabled = true },
	enumMemberValues = { enabled = true },
}

---@type vim.lsp.Config
return {
	settings = {
		vtsls = {
			-- Use the TypeScript the project itself depends on rather than the one
			-- bundled with the server, so the editor and `tsc` agree on the language
			-- version.
			autoUseWorkspaceTsdk = true,
		},
		typescript = {
			tsserver = {
				-- tsserver is capped at 3 GB by default and dies mid-session on a
				-- large monorepo. This is passed through as --max-old-space-size.
				maxTsServerMemory = 8192,
			},
			inlayHints = inlay_hints,
		},
		javascript = {
			inlayHints = inlay_hints,
		},
	},
}
