-- Setup TypeScript LSP with vim.lsp.config
vim.lsp.config.ts_ls = {
	cmd = { 'typescript-language-server', '--stdio' },
	filetypes = {
		'javascript',
		'javascriptreact',
		'javascript.jsx',
		'typescript',
		'typescriptreact',
		'typescript.tsx',
	},
	root_markers = { 'tsconfig.json', 'jsconfig.json', 'package.json', '.git' },
	settings = {
		init_options = { hostInfo = 'neovim' },
	},
}

vim.lsp.enable('ts_ls')
