-- Cross-cutting LSP behaviour only.
--
-- Servers are installed and enabled by mason-lspconfig (lua/plugins/lsp/plugins.lua)
-- and configured per server in after/lsp/<name>.lua, so nothing here calls
-- mason.setup(), vim.lsp.config() or vim.lsp.enable().

vim.diagnostic.config({
	virtual_text = { spacing = 2, prefix = "●" },
	severity_sort = true,
	float = { border = "rounded", source = true },
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("LspAttachSetup", { clear = true }),
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if not client then
			return
		end

		-- Python runs ruff and basedpyright side by side. Both advertise hover, and
		-- the reply comes from whichever attached first, so hover would sometimes
		-- return a lint message where a type was wanted. basedpyright owns hover.
		if client.name == "ruff" then
			client.server_capabilities.hoverProvider = false
		end

		-- Every server configured under after/lsp/ asks for inlay hints; this is
		-- what actually renders them. Toggle with vim.lsp.inlay_hint.enable().
		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
		end
	end,
})
