local conform = require("conform")

conform.setup({
	formatters_by_ft = {
	  lua = { "stylua" },
	  python = { "autopep8" },
	  cpp = { "clang_format" },
	  c = { "clang_format" },
	  go = { "gofumpt" },
	  cs = { "csharpier" },
	  yaml = { "yamlfmt" },
	  css = { "prettier" },
	  flow = { "prettier" },
	  graphql = { "prettier" },
	  html = { "prettier" },
	  json = { "prettier" },
	  javascriptreact = { "prettier" },
	  javascript = { "prettier" },
	  less = { "prettier" },
	  markdown = { "prettier" },
	  scss = { "prettier" },
	  typescript = { "prettier" },
	  typescriptreact = { "prettier" },
	  vue = { "prettier" },	
		-- lua = { "stylua" },
		-- -- Conform will run multiple formatters sequentially
		-- python = { "isort", "black" },
		-- -- You can customize some of the format options for the filetype (:help conform.format)
		-- rust = { "rustfmt", lsp_format = "fallback" },
		-- -- Conform will run the first available formatter
		-- javascript = { "prettierd", "prettier" },
		-- typescript = { "prettierd", "prettier" },
		-- typescriptreact = { "prettierd", "prettier" },
	},
	-- Add keymap for formatting when <leader>p is pressed
	format_on_save = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	},
})

vim.keymap.set("n", "<leader>p", function()
	conform.format({
		lsp_fallback = true,
		async = true,
		timeout_ms = 500,
	})
end, { expr = false, desc = "Conform: Format" })
