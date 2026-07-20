return {
	{
		"saghen/blink.cmp",

		-- Use a release tag so lazy downloads the pre-built fuzzy-matcher binary
		-- instead of needing a Rust toolchain.
		version = "1.*",

		-- Without `opts`, lazy never runs blink's config step. It still worked,
		-- because blink self-registers from its plugin/ directory, but nothing
		-- here was configurable. Declaring opts makes the config explicit.
		opts = {
			keymap = {
				preset = "default",
			},
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
			-- Rust fuzzy matcher, falling back to the Lua one if the binary is
			-- missing rather than erroring out.
			fuzzy = {
				implementation = "prefer_rust_with_warning",
			},
		},
	},
}
