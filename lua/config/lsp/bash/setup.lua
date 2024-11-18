local lspconfig = require('lspconfig')

lspconfig.bashls.setup {
  cmd = { "bash-language-server", "start" },
  filetypes = { "sh", "bash" },
  root_dir = lspconfig.util.find_git_ancestor or vim.loop.os_homedir,
  settings = {
    bashIde = {
      enable = true,
      globPattern = "**/*@(.sh|.inc|.bash|.command)"
    },
  },
--  on_attach = function(client, bufnr)
--    -- Set up buffer-local keybindings for LSP-related actions
--    local opts = { noremap=true, silent=true }
--    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
--    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
--  end,
}

