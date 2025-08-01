require("mason").setup()

-- local has_words_before = function()
--   unpack = unpack or table.unpack
--   local line, col = unpack(vim.api.nvim_win_get_cursor(0))
--   return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
-- end

-- Set up `nvim-cmp`
local cmp = require("cmp")
cmp.setup({
	-- Configure completion window
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	-- Start mapping from scratch
	mapping = cmp.mapping.preset.insert({
		['<S-Tab>'] = cmp.mapping(cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }), { 'i' }),
		['<C-A>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		},
	}),
	formatting = {
		fields = { "abbr", "kind", "menu" },
		format = function(entry, vim_item)
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				buffer = "[Buffer]",
				path = "[Path]",
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lua' },
		{ name = 'buffer',    keyword_length = 5 },
		-- { name = 'path' },
		{ name = 'async_path' }
	}),
})

-- local blink = require("blink.cmp")

-- -- Navigate through the suggestions using S-Tab
-- vim.keymap.set("i", "<S-Tab>", blink.blink_prev)

-- -- Accept using C-Space
-- vim.keymap.set("i", "<C-Space>", blink.accept)
