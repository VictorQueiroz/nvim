local builtin = require('telescope.builtin')
local tree = require('nvim-tree.api')

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
