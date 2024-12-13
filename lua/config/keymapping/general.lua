-- Alt + [ and Alt + ] should cycle through Codeium suggestions
vim.keymap.set("i", "<A-[>", function()
  vim.fn['codeium#CycleCompletions'](-1)
end, { expr = true, noremap = true, silent = true })
vim.keymap.set("i", "<A-]>", function()
  vim.fn['codeium#CycleCompletions'](1)
end, { expr = true, noremap = true, silent = true })

vim.keymap.set("i", "<Tab>", function()
  -- Give priority to `nvim-cmp`
  -- if cmp.visible() then
  --   return
  -- elseif vim.fn['codeium#Accept'] ~= nil then
  --   return vim.fn['codeium#Accept']()
  -- end
  return vim.fn['codeium#Accept']()
end, { expr = true, noremap = true, silent = true })

local cmp = require('cmp')

-- vim.keymap.set("i", "<Tab>", function(fallback)
--   -- Give priority to `nvim-cmp`
--   if cmp.visible() then
--     print("CMP is visible")
--     return cmp.confirm({ select = true })
--   elseif vim.fn['codeium#Accept'] ~= nil then
--     print("Codeium")
--     return vim.fn['codeium#Accept']()
--   else
--     return fallback()
--   end
-- end, { expr = true, noremap = true, silent = true })

-- FIXME: Fix these mappings. There must be a way that `nvim-cmp` allow us to set the keymappings here.

-- Alt + c to toggle between Codeium and cmp completion
-- local codeium_enabled = true
-- vim.keymap.set("n", "<A-c>", function()
--   codeium_enabled = not codeium_enabled
--   print("Codeium enabled:", codeium_enabled)
-- end, { noremap = true, silent = true })

-- Alt + \ should trigger Codeium completion
-- vim.keymap.set("i", "<A-\\>", function()
--   if codeium_enabled and vim.fn['codeium#Accept'] ~= nil then
--     return vim.fn['codeium#Accept']()
--   end
--   return ''
-- end, { expr = true, noremap = true, silent = true })

-- Autocomplete with <Tab>
-- vim.keymap.set('i', '<Tab>', function()
--   local cmp = require('cmp')
--   -- Give priority to `nvim-cmp`
--   if cmp.visible() then
--     cmp.confirm({ select = true })
--     return ''
--   elseif codeium_enabled and vim.fn['codeium#Accept'] ~= nil then
--     return vim.fn['codeium#Accept']()
--   else
--     return '\t'
--   end
-- end, { expr = true, noremap = true, silent = true })

-- vim.keymap.set('i', '<S-Tab>', function()
--   local cmp = require('cmp')
--   if cmp.visible() then
--     cmp.select_prev_item()
--     return ''
--   elseif vim.fn['codeium#CycleCompletions'] ~= nil then
--     return vim.fn['codeium#CycleCompletions'](-1)
--   else
--     return '\b' -- Insert a literal backspace
--   end
-- end, { expr = true, noremap = true, silent = true })
