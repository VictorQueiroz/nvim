-- Setup lspconfig
local lspconfig = require('lspconfig')
local util = require('lspconfig.util')

require('lspconfig').ts_ls.setup({
	init_options = { hostInfo = 'neovim' },
	cmd = { 'typescript-language-server', '--stdio' },
	filetypes = {
		'javascript',
		'javascriptreact',
		'javascript.jsx',
		'typescript',
		'typescriptreact',
		'typescript.tsx',
	},
	root_dir = util.root_pattern('tsconfig.json', 'jsconfig.json', 'package.json', '.git'),
	single_file_support = true,
})
