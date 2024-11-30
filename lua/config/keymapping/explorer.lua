-- Toggle tree
local tree = require("nvim-tree.api")
vim.keymap.set("n", "<leader>tt", tree.tree.toggle, { desc = "Toggle Tree" })
