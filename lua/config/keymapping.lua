-- local builtin = require('telescope.builtin')
-- local tree = require('nvim-tree.api')
-- -- 
-- -- vim.g.mapleader = " "
-- -- 
-- -- vim.g.codeium_disable_bindings = 1
-- -- 
-- -- -- Telescope
-- -- -- Set keybindings for Telescope
-- -- vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope Find Files" })
-- -- -- vim.keymap.set("n", "<C-a>", builtin.find_files, { desc = "Telescope Find Files" })
-- -- 
-- -- -- Set keymap to collapse/uncollapse
-- -- vim.keymap.set("n", "<C-l>", tree.tree.toggle, { desc = "Toggle nvim-tree" })
-- -- 
-- -- -- Telescope
-- -- vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = "Live Grep" })
-- -- 
-- -- -- Codeium
-- -- vim.keymap.set('i', '<C-y>', function()
-- -- 	return vim.fn['codeium#Accept']()
-- -- end, { expr = true, desc = "Accept Codeium Completion" })
-- -- 
-- -- vim.keymap.set('i', '<^[]>', function()
-- -- 	return vim.fn['codeium#CycleCompletions'](1)
-- -- end, { expr = true, desc = "Next Codeium Completion" })
-- -- 
-- -- vim.keymap.set('i', '<^[[>', function()
-- -- 	return vim.fn['codeium#CycleCompletions'](-1)
-- -- end, { expr = true, desc="Previous Codeium Completion" })
-- -- 
-- -- -- coc.nvim
-- -- -- Next LSP suggestion
-- -- vim.keymap.set('i', '<C-j>', 'coc#pum#next(1)', {
-- -- 	silent = true,
-- -- 	expr = true,
-- -- 	desc = "Next LSP Completion"
-- -- })
-- -- 
-- -- -- Previous LSP suggestion
-- -- vim.keymap.set('i', '<C-k>', 'coc#pum#prev(1)', {
-- -- 	silent = true,
-- -- 	expr = true,
-- -- 	desc = "Previous LSP Completion"
-- -- })
-- -- 
-- -- -- Accept LSP Completion
-- -- vim.keymap.set('i', '<C-y>', 'coc#pum#confirm()', {
-- -- -- vim.keymap.set('i', '<Tab>', 'coc#pum#visible() ? coc#pum#confirm() : com#pum#refresh()', {
-- -- 	silent = true,
-- -- 	expr = true,
-- -- 	desc = "Accept LSP Completion"
-- -- })
-- 
-- -- See: https://chatgpt.com/c/67449ac4-4780-8012-ba34-0514b59c78db
-- local builtin = require('telescope.builtin')
-- local tree = require('nvim-tree.api')
-- 
-- vim.g.mapleader = " "
-- 
-- vim.g.codeium_disable_bindings = 1
-- 
-- -- Telescope Keybindings
-- vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope Find Files" })
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
-- 
-- -- nvim-tree
-- vim.keymap.set("n", "<C-l>", tree.tree.toggle, { desc = "Toggle nvim-tree" })
-- 
-- -- Codeium Keybindings
-- vim.keymap.set('i', '<C-y>', function()
-- 	return vim.fn['codeium#Accept']()
-- end, { expr = true, desc = "Accept Codeium Completion" })
-- 
-- vim.keymap.set('i', '<C-j>', function()
-- 	return vim.fn
-- end, { expr = true, desc = "Next Codeium Completion" })
-- 
-- vim.keymap.set('i', '<C-k>', function()
-- 	return vim.fn['codeium#CycleCompletions'](-1)
-- end, { expr = true, desc = "Previous Codeium Completion" })
-- 
-- -- coc.nvim Keybindings
-- vim.keymap.set('i', '<C-j>', 'coc#pum#next(1)', {
-- 	silent = true,
-- 	expr = true,
-- 	desc = "Next LSP Completion"
-- })
-- 
-- vim.keymap.set('i', '<C-k>', 'coc#pum#previous(1)', {
-- 	silent = true,
-- 	expr = true,
-- 	desc = "Previous LSP Completion"
-- })
-- 
-- local coc = require('coc')
-- vim.keymap.set('i', '<C-y>', 'coc#pum#confirm()', {
-- 	silent = true,
-- 	expr = true,
-- 	desc = "Accept LSP Completion"
-- })

local builtin = require('telescope.builtin')

-- Change mapleader to whitespace
vim.g.mapleader = " "

-- Disable default Codeium bindings
vim.g.codeium_disable_bindings = 1

-- Telescope Keybindings
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })

-- Autocomplete with <Tab>
vim.keymap.set('i', '<Tab>', function()
    -- Handle Tab behavior for both Codeium and coc.nvim
    if vim.fn['coc#pum#visible']() == 1 then
        return vim.fn['coc#pum#confirm']() -- Confirm coc.nvim completion
    elseif vim.fn['codeium#Accept'] ~= nil then
        return vim.fn['codeium#Accept']() -- Accept Codeium suggestion
    else
        return '\t' -- Insert a literal tab
    end
end, { expr = true, noremap = true, silent = true })

vim.keymap.set('i', '<S-Tab>', function()
    -- Handle backward navigation for coc.nvim and Codeium
    if vim.fn['coc#pum#visible']() == 1 then
        -- return vim.fnard in coc.nvim popup
				return vim.fn['coc#pum#next'](1) 
    elseif vim.fn['codeium#CycleCompletions'] ~= nil then
        return vim.fn['codeium#CycleCompletions'](-1) -- Cycle backward in Codeium suggestions
    else
        return '\b' -- Insert a literal backspace (mimics <S-Tab>)
    end
end, { expr = true, noremap = true, silent = true })
