local builtin = require('telescope.builtin')

-- NvimTree Keybindings
vim.keymap.set("n", "<leader>tt", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })

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

