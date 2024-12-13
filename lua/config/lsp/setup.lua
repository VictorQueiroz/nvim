require("mason").setup()

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

local cmp = require("cmp")
cmp.setup({
	-- Start mapping from scratch
	mapping = cmp.mapping.preset.insert({
		['<C-e>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,

    ['<S-e>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,

		['<C-Space>'] = cmp.mapping.confirm {
		  behavior = cmp.ConfirmBehavior.Insert,
		  select = true,
		},
  }),
	-- Disable mapping
	-- mapping = {
	-- 	["<Tab>"] = cmp.config.disable,
	-- 	["<S-Tab>"] = cmp.config.disable
	-- 	-- ['<Tab>'] = cmp.mapping(function(fallback)
	-- 	--   -- Give priority to `nvim-cmp`
	-- 	--   if cmp.visible() then
	-- 	--   	print("CMP is visible")
	-- 	--     return cmp.confirm({ select = true })
	-- 	--   elseif vim.fn['codeium#Accept'] ~= nil then
	-- 	--     return vim.fn['codeium#Accept']()
	-- 	--   else
	-- 	--     return fallback()
	-- 	--   end
	-- 	-- end),
	-- 	-- ['<S-Tab>'] = cmp.mapping(function(fallback)
	-- 	--   if cmp.visible() then
	-- 	--     cmp.select_prev_item()
	-- 	--     return ''
	-- 	--   end

	--   --   return fallback()
	-- 	-- end)
	-- },
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'buffer' },
	}),
})

-- Setup lspconfig
local lspconfig = require('lspconfig')

-- Deprecated
-- lspconfig.tsserver.setup({
--   -- root_dir = lspconfig.util.root_pattern("tsconfig.json", "package.json", ".git"),
--   init_options = {
--     preferences = {
--       -- disableSuggestions = true, -- Disables TypeScript auto-suggestions if you don't need them
--     },
--   },
--   capabilities = require('cmp_nvim_lsp').default_capabilities(),
-- })

-- Deprecated
-- lspconfig.tsserver.setup({
-- --   cmd = { "typescript-language-server", "--stdio" },
-- --   root_dir = lspconfig.util.root_pattern("tsconfig.json", "package.json", ".git"),
--   on_attach = function(client, bufnr)
--     -- Disable tsserver's formatting to use external formatters like Prettier
--     client.server_capabilities.documentFormattingProvider = false
-- 
--     -- Key mappings for LSP (e.g., go-to-definition, hover, references)
--     local bufopts = { noremap = true, silent = true, buffer = bufnr }
--     vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
--     vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
--     vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
--     vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
--   end,
--   capabilities = require('cmp_nvim_lsp').default_capabilities(),
--   init_options = {
--     hostInfo = "neovim",
--     preferences = {
--       disableSuggestions = false, -- Enable tsserver suggestions
--     },
--   },
-- })

require('lspconfig').ts_ls.setup{
--   init_options = {
--     plugins = {
--       {
--         name = "@vue/typescript-plugin",
--         location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
--         languages = {"javascript", "typescript", "vue"},
--       },
--     },
--   },
  filetypes = {
    "javascript",
    "typescript",
    "vue",
  },
}

require('config.lsp.bash.setup')
require('config.lsp.lua.setup')
require('config.lsp.spellcheck.setup')

