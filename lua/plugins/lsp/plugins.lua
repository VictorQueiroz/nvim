return {
	-- Server installation and enabling.
	--
	-- mason-lspconfig installs everything in `ensure_installed` that is missing
	-- (on startup, and it enables each one as soon as its install finishes), then
	-- calls vim.lsp.enable() for every server mason has installed. So no server is
	-- ever enabled by hand, and a fresh clone bootstraps itself on first launch.
	--
	-- Per-server settings live in after/lsp/<name>.lua. Neovim merges those over
	-- the defaults nvim-lspconfig ships in its own lsp/<name>.lua, which is why
	-- none of them restate cmd/filetypes/root_markers.
	--
	-- Load order is load-bearing: mason must be set up and nvim-lspconfig must be
	-- on the runtimepath before mason-lspconfig runs. `dependencies` guarantees it.
	{
		"mason-org/mason-lspconfig.nvim",
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
		opts = {
			ensure_installed = {
				"bashls",
				"basedpyright", -- Python: types, hover, completion
				"clangd", -- C and C++
				"jsonls",
				"lua_ls",
				"ruff", -- Python: lint, format, import sorting
				"rust_analyzer",
				"vtsls", -- TypeScript/JavaScript
			},
			automatic_enable = true,
		},
	},

	-- JSON/YAML schema catalogue, consumed by the jsonls config.
	{ "b0o/schemastore.nvim" },

	{
		"SmiteshP/nvim-navbuddy",
		dependencies = {
			"SmiteshP/nvim-navic",
			"MunifTanjim/nui.nvim",
		},
		opts = {
			lsp = { auto_attach = true },
		},
	},

	-- Tree-sitter. This is the `main` branch (the v1.0 rewrite), which drops the
	-- old `nvim-treesitter.configs` module: parsers are installed explicitly and
	-- highlighting is turned on per buffer with vim.treesitter.start().
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function()
			local ts = require("nvim-treesitter")

			ts.setup({})

			-- There is no separate `jsonc` grammar; the json parser handles it.
			vim.treesitter.language.register("json", "jsonc")

			local ensure_installed = {
				"bash",
				"c",
				"cpp",
				"css",
				"diff",
				"dockerfile",
				"git_config",
				"gitcommit",
				"gitignore",
				"go",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"scss",
				"toml",
				"tsx",
				"typescript",
				"vim",
				"vimdoc",
				"yaml",
			}

			local installed = {}
			for _, lang in ipairs(ts.get_installed()) do
				installed[lang] = true
			end

			local missing = vim.tbl_filter(function(lang)
				return not installed[lang]
			end, ensure_installed)

			if #missing > 0 then
				ts.install(missing)
			end

			-- Highlighting is opt-in per buffer on the main branch.
			local max_filesize = 100 * 1024

			vim.api.nvim_create_autocmd("FileType", {
				group = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
				callback = function(ev)
					local lang = vim.treesitter.language.get_lang(ev.match)
					if not lang then
						return
					end

					-- Tree-sitter parsing is too slow to be worth it on huge files.
					local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(ev.buf))
					if ok and stats and stats.size > max_filesize then
						return
					end

					if not pcall(vim.treesitter.start, ev.buf, lang) then
						return
					end

					vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
				end,
			})
		end,
	},

	-- Shows the enclosing scope (function/class/if) pinned at the top of the
	-- window. Replaces wellle/context.vim, which used regex heuristics.
	{
		"nvim-treesitter/nvim-treesitter-context",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = {
			max_lines = 3,
		},
	},
}
