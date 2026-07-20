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
    -- Prefer prettierd (a persistent daemon) and fall back to prettier: on a
    -- format-on-save path, prettier's Node startup dominates the 500ms budget.
    css = { "prettierd", "prettier" },
    graphql = { "prettierd", "prettier" },
    html = { "prettierd", "prettier" },
    json = { "prettierd", "prettier" },
    jsonc = { "prettierd", "prettier" },
    javascript = { "prettierd", "prettier" },
    javascriptreact = { "prettierd", "prettier" },
    less = { "prettierd", "prettier" },
    markdown = { "prettierd", "prettier" },
    scss = { "prettierd", "prettier" },
    typescript = { "prettierd", "prettier" },
    typescriptreact = { "prettierd", "prettier" },
    vue = { "prettierd", "prettier" },
  },

  -- `lsp_fallback` is the deprecated spelling; conform now wants
  -- `lsp_format = "fallback"`.
  format_on_save = {
    lsp_format = "fallback",
    timeout_ms = 500,
  },
})

vim.keymap.set("n", "<leader>p", function()
  conform.format({
    lsp_format = "fallback",
    async = true,
  })
end, { desc = "Conform: Format" })
