return {
  -- Seamless navigation between Neovim splits and tmux panes. Needs both a
  -- setup() call and keymaps -- it had neither, so it did nothing.
  {
    "numToStr/Navigator.nvim",
    opts = {},
    keys = {
      { "<C-h>", "<cmd>NavigatorLeft<cr>", desc = "Navigate left (tmux-aware)" },
      { "<C-j>", "<cmd>NavigatorDown<cr>", desc = "Navigate down (tmux-aware)" },
      { "<C-k>", "<cmd>NavigatorUp<cr>", desc = "Navigate up (tmux-aware)" },
      { "<C-l>", "<cmd>NavigatorRight<cr>", desc = "Navigate right (tmux-aware)" },
    },
  },
}
