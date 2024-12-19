-- Alt + [ and Alt + ] should cycle through Codeium suggestions
function configure_codeium_keybindings()
  vim.keymap.set("i", "<A-[>", function()
    vim.fn['codeium#CycleCompletions'](-1)
  end, { expr = true, noremap = true, silent = true })

  vim.keymap.set("i", "<A-]>", function()
    vim.fn['codeium#CycleCompletions'](1)
  end, { expr = true, noremap = true, silent = true })

  vim.keymap.set("i", "<Tab>", function()
    return vim.fn['codeium#Accept']()
  end, { expr = true, noremap = true, silent = true })
end

configure_codeium_keybindings()
