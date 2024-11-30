return {
	{
		"nvim-tree/nvim-tree.lua"
	},
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = {
      "rcarriga/nvim-notify",
      'nvim-lua/plenary.nvim'
    }
  },

--  {
--    "ibhagwan/fzf-lua",
--    -- optional for icon support
--    dependencies = { "nvim-tree/nvim-web-devicons" },
--    config = function()
--      -- calling `setup` is optional for customization
--      require("fzf-lua").setup({})
--    end
--  },

  -- 
  -- { "mbbill/undotree" },
  { "mbbill/undotree" },

  -- Integration for buffers
  { "lewis6991/gitsigns.nvim" },

  -- The trashiest of neovim lua configs for the one and only trash_dev. 🗑
  { "ixahmedxi/trashvim" },

  -- This neovim plugin creates missing folders on save.
  { "jghauser/mkdir.nvim" },

  -- 🧶 Automatically save your changes in NeoVim
  -- { "Pocco81/auto-save.nvim" },

  -- Syncing files with remote server using rsync and OpenSSH
  -- { "coffebar/transfer.nvim" },
}
