local builtin = require('telescope.builtin')
local tree = require('nvim-tree.api')

vim.g.codeium_disable_bindings = 1

-- Telescope
-- Set keybindings for Telescope
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope Find Files" })
-- vim.keymap.set("n", "<C-a>", builtin.find_files, { desc = "Telescope Find Files" })

-- Set keymap to collapse/uncollapse
vim.keymap.set("n", "<C-b>", tree.tree.toggle, { desc = "Toggle nvim-tree" })

-- fzf-lua
-- When Control +  is pressed, open the selected archive in a new tab
-- vim.keymap.set("n", "<c-a>", require('fzf-lua').files, { desc = "Fzf Files" })
-- Set c-P to open fuzzy finder item
-- vim.keymap.set("n", "<c-P>", require('fzf-lua').files, { desc = "Fzf Files" })

-- Telescope
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = "Live Grep" })

-- Codeium
vim.keymap.set('i', '<Tab>', function()
	return vim.fn['codeium#Accept']()
end, { expr = true, desc = "Accept Codeium Completion" })

vim.keymap.set('i', '<^[]>', function()
	return vim.fn['codeium#CycleCompletions'](1)
end, { expr = true, desc = "Next Codeium Completion" })

vim.keymap.set('i', '<^[[>', function()
	return vim.fn['codeium#CycleCompletions'](-1)
end, { expr = true, desc="Previous Codeium Completion" })

-- coc.nvim
-- Next LSP suggestion
vim.keymap.set('i', '<C-j>', 'coc#pum#next(1)', {
	silent = true,
	expr = true,
	desc = "Next LSP Completion"
})

-- Previous LSP suggestion
vim.keymap.set('i', '<C-k>', 'coc#pum#prev(1)', {
	silent = true,
	expr = true,
	desc = "Previous LSP Completion"
})

-- Accept LSP Completion
-- vim.keymap.set('i', '<C-y>', [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], {
vim.keymap.set('i', '<C-y>', 'coc#pum#confirm()', {
	silent = true,
	expr = true,
	desc = "Accept LSP Completion"
})


