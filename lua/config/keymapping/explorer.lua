-- Toggle tree
local tree = require("nvim-tree.api")
vim.keymap.set("n", "<leader>tt", tree.tree.toggle, { desc = "Toggle Tree" })

-- Telescope Keybindings
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<C-p>", builtin.find_files, { desc = "Telescope Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
