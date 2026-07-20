-- Only `cmd` is overridden; nvim-lspconfig's lsp/clangd.lua already supplies the
-- filetypes, root markers, offset-encoding negotiation and the
-- :LspClangdSwitchSourceHeader / :LspClangdShowSymbolInfo commands.
--
-- No `fallbackFlags` here on purpose: a single flag list has to serve both C and
-- C++, and forcing e.g. -std=c++20 makes clangd reject every .c file. Give clangd
-- a compile_commands.json (CMAKE_EXPORT_COMPILE_COMMANDS=ON, or `bear -- make`),
-- or a compile_flags.txt / .clangd file for a small project.
---@type vim.lsp.Config
return {
	cmd = {
		"clangd",
		-- Index the whole project in the background so cross-file references and
		-- workspace symbols work, not just whatever is currently open.
		"--background-index",
		"--clang-tidy",
		-- iwyu only inserts a header when the symbol is genuinely not reachable.
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		"--fallback-style=llvm",
	},
	init_options = {
		clangdFileStatus = true,
	},
}
