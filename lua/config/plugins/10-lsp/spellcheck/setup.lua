-- Spell checking, for prose only.
--
-- This previously called vim.opt_local.spell at config-load time, which applied
-- to whichever buffer happened to be current while init ran -- usually the empty
-- scratch buffer -- and to nothing else. It belongs on a FileType autocmd.
--
-- The Grammarly LSP that used to be enabled here is gone: Grammarly shut down
-- the public API that grammarly-languageserver talked to, so it could never
-- attach.
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("SpellcheckProse", { clear = true }),
  pattern = { "markdown", "text", "gitcommit", "org", "norg", "tex", "rst" },
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en_us"
  end,
})
