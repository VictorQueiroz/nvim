return {
	-- LSP client manager
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
	},

	{
    "SmiteshP/nvim-navbuddy",
    dependencies = {
      "SmiteshP/nvim-navic",
      "MunifTanjim/nui.nvim"
    },
    opts = {
			lsp = { auto_attach = true }
		}
	},

	-- Code completion
	{
		'hrsh7th/nvim-cmp',
		dependencies = {
			'hrsh7th/cmp-nvim-lua',

			-- Git source for nvim-cmp
			"petertriho/cmp-git",

			-- LSP source
			'hrsh7th/cmp-nvim-lsp',

			-- Buffer source
			-- 'hrsh7th/cmp-buffer',

			-- Path source
			-- 'hrsh7th/cmp-path',

			-- nvim-cmp source for filesystem paths with async processing (neovim won't block while reading from disk).
			"FelipeLema/cmp-async-path",

			-- spell source for nvim-cmp based on vim's spellsuggest.
			'f3fora/cmp-spell',
		},
	},

	{
		"neovim/nvim-lspconfig",

		dependencies = { 'hrsh7th/nvim-cmp', 'saghen/blink.cmp' },

	  -- example using `opts` for defining servers
	  opts = {
	    servers = {
	      lua_ls = {}
	    }
	  },
	  config = function(_, opts)
	    local lspconfig = require('lspconfig')
	    for server, config in pairs(opts.servers) do
	      -- passing config.capabilities to blink.cmp merges with the capabilities in your
	      -- `opts[server].capabilities, if you've defined it
	      config.capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities)
	      lspconfig[server].setup(config)
	    end
	  end
	},

	-- -- blink.cmp is a completion plugin with support for LSPs and external sources that updates on every keystroke with minimal overhead (0.5-4ms async). It use a custom SIMD fuzzy searcher to easily handle >20k items. It provides extensibility via hooks into the trigger, sources and rendering pipeline. Plenty of work has been put into making each stage of the pipeline as intelligent as possible, such as frecency and proximity bonus on fuzzy matching, and this work is on-going.
	-- {
	--   'saghen/blink.cmp',
	--   -- optional: provides snippets for the snippet source
	--   -- dependencies = 'rafamadriz/friendly-snippets',

	--   -- use a release tag to download pre-built binaries
	--   version = '*',
	--   -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	--   -- build = 'cargo build --release',
	--   -- If you use nix, you can build from source using latest nightly rust with:
	--   -- build = 'nix run .#build-plugin',

	--   ---@module 'blink.cmp'
	--   ---@type blink.cmp.Config
	--   opts = {
	--     -- 'default' for mappings similar to built-in completion
	--     -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
	--     -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
	--     -- See the full "keymap" documentation for information on defining your own keymap.
	--     keymap = {
	--     	preset = 'none',
	--     	-- ['<S-Tab>'] = { 'select_next', 'fallback' },
	--     	-- ['<C-Space>'] = { 'accept', 'fallback' },
	--     	-- ['<C-j>'] = { 'show_documentation', 'fallback' },
	--     },

	--     appearance = {
	--       -- Sets the fallback highlight groups to nvim-cmp's highlight groups
	--       -- Useful for when your theme doesn't support blink.cmp
	--       -- Will be removed in a future release
	--       use_nvim_cmp_as_default = true,
	--       -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
	--       -- Adjusts spacing to ensure icons are aligned
	--       nerd_font_variant = 'mono'
	--     },

	--     -- Default list of enabled providers defined so that you can extend it
	--     -- elsewhere in your config, without redefining it, due to `opts_extend`
	--     sources = {
	--       default = { 'lsp', 'path', 'snippets', 'buffer' },
	--     },
	--   },
	--   opts_extend = { "sources.default" }
	-- },	

  -- {
  -- 	"saghen/blink.cmp",
  --   opts = {
  --     sources = {
  --       -- add lazydev to your completion providers
  --       default = { "lazydev", "lsp", "path", "snippets", "buffer" },
  --       providers = {
  --         lazydev = {
  --           name = "LazyDev",
  --           module = "lazydev.integrations.blink",
  --           -- make lazydev completions top priority (see `:h blink.cmp`)
  --           score_offset = 100,
  --         },
  --       },
  --     },
  --   },
  -- }	

	-- 💻 Neovim setup for init.lua and plugin development with full signature help, docs and completion for the nvim lua API.
	{ 
		"folke/neodev.nvim", 
		on_attach = function()
			local neodev = require('neodev')
			neodev.setup({
				library = {
					enabled = true, -- when not enabled, neodev will not change any settings to the LSP server
					-- these settings will be used for your Neovim config directory
					runtime = true, -- runtime path
					types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
					plugins = true, -- installed opt or start plugins in packpath
					-- you can also specify the list of plugins to make available as a workspace library
					-- plugins = { "nvim-treesitter", "plenary.nvim", "telescope.nvim" },
				},
				setup_jsonls = true, -- configures jsonls to provide completion for project specific .luarc.json files
				-- for your Neovim config directory, the config.library settings will be used as is
				-- for plugin directories (root_dirs having a /lua directory), config.library.plugins will be disabled
				-- for any other directory, config.library.enabled will be set to false
				override = function(root_dir, options) end,
				-- With lspconfig, Neodev will automatically setup your lua-language-server
				-- If you disable this, then you have to set {before_init=require("neodev.lsp").before_init}
				-- in your lsp start options
				lspconfig = true,
				-- much faster, but needs a recent built of lua-language-server
				-- needs lua-language-server >= 3.6.0
				pathStrict = true,
			})
		end
	},

	-- null-ls.nvim reloaded / Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
	-- { "nvimtools/none-ls.nvim" },

	-- Check syntax in Vim/Neovim asynchronously and fix files, with Language Server Protocol (LSP) support
	-- { "dense-analysis/ale" },

	-- Better defaults for nvim-lsp actions.
	-- { "RishabhRD/nvim-lsputils" },

	-- NOTE: Makes no sense while mouse is disabled
	-- The plugin shows a lightbulb in the sign column whenever a textDocument/codeAction is available at the current cursor position.
	-- { "kosayoda/nvim-lightbulb" },

	-- IDE-like breadcrumbs, out of the box.
	-- { "Bekaboo/dropbar.nvim" },

	-- Resolve imports
	-- { "stevanmilic/nvim-lspimport" },

	-- Nvim Treesitter configurations and abstraction layer
	{
		"nvim-treesitter/nvim-treesitter",
		highlight = {
			enable = true,
			disable = function(lang, buf)
				-- Disable for large files
				local max_filesize = 100 * 1024 -- 100 KB
				local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
				if ok and stats and stats.size > max_filesize then
					return true
				end
			end,
		},
		incremental_selection = {
			enable = true,
		},
		indent = { enable = false },
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	},
}
