local lspconfig = require('lspconfig')

-- Configure Lua language server
lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        globals = { 'vim' },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false, -- To avoid unnecessary prompts
      },
      telemetry = { enable = false },
    },
  },
}

-- require("luasnip.loaders.from_vscode").lazy_load()                                                                                                                      
-- 
-- require("luasnip.loaders.from_vscode").lazy_load({paths = "~/.config/nvim/luasnip/snippets/"})
