# My personal NeoVim configuration

## To-Do

- [ ] Consider switching from `coc.nvim`.

### Migrating out of `coc.nvim`

- [williamboman/mason.nvim]()

#### `williamboman/mason.nvim`

```lua
return {
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
};
```

*Configure**

```lua
require('mason-lspconfig').setup {
    -- A list of servers to automatically install if they're not already installed. Example: { "rust_analyzer@nightly", "lua_ls" }
    -- This setting has no relation with the `automatic_installation` setting.
    ---@type string[]
    ensure_installed = {
			-- JavaScript
			"biome",
			"eslint",
			"jsonls",
			"tsserver",
			"ts_ls",
			"rome",
			"quick_lint_js",
			"lwc_ls",
			"harper_ls",
			"glint",
			"eslint",
			"denols",
			
			-- Gradle
			"gradle_ls",
			"groovy",

			-- GLSL
			"glslls",

			-- HTMX
			"htmx",

			-- Kotlin
			"kotlin_language_server",

			-- LESS
			"css_variables",
			"cssls",

			-- Lua
			"luau_lsp",
			"lua_ls",

			-- Markdown
			"grammarly",
			"harper_ls",
			"ltex",
			"markdown_oxide",
			"marksman",
			"prosemd_lsp",
			"remark_ls",
			"vale_ls",
			"zk",

			-- Meson
			"mesonlsp",
			"swift_mesonls",

			-- Nginx
			"nginx_language_server",

			-- Nunjucks
			"jinja_lsp",

			-- OpenCL
			"opencl_ls",

			-- OpenGL
			"glsl_analyzer",

			"basedpyright",
			"harper_ls",


			-- Java
			"graphql",

			-- HTML
			"templ",
			"lwc_ls",
			"stimulus_ls",

			-- Docker
			"docker_compose_language_service",
			"dockerls",

			"lua_ls"
			"clangd",	
			"pkgbuild_language_server",
			"bashls",
			"cmake",
			"cssls",
			"emmet_language_server",
			"emmet_ls",
			"dotls",
			"unocss",
			"asm_lsp",
			"azure_pipelines_ls",
			"angularls",
			"html",
			"marksman",
			"pyright",
			"rust_analyzer",
			"tailwindcss",
			"vimls",
			"yamlls",
			"arduino_language_server",
			"harper_ls",
			"ast_grep",
		},

    -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
    -- This setting has no relation with the `ensure_installed` setting.
    -- Can either be:
    --   - false: Servers are not automatically installed.
    --   - true: All servers set up via lspconfig are automatically installed.
    --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
    --       Example: automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }
    ---@type boolean
    automatic_installation = false,

    -- See `:h mason-lspconfig.setup_handlers()`
    ---@type table<string, fun(server_name: string)>?
    handlers = nil,
}
```

neovim/nvim-lspconfig


## Enable/disable `hardtime.nvim`

```
:Hardtime enable/disable/toggle
```
