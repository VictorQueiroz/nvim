return {
--  { "nvim-lua/popup.nvim" },
--  { "nvim-lua/plenary.nvim" },
--  { "nvim-telescope/telescope.nvim" },
--  { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
--  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
--  { "nvim-treesitter/nvim-treesitter-textobjects" },
--  { "nvim-treesitter/playground" },
--  { "nvim-tree/nvim-web-devicons" },
--  { "nvim-lualine/lualine.nvim" },
--  { "nvim-lua/lsp-status.nvim" },
--  { "hrsh7th/nvim-cmp" },
--  { "hrsh7th/cmp-nvim-lsp" },
--  { "hrsh7th/cmp-path" },
--  { "hrsh7th/cmp-buffer" },
--  { "L3MON4D3/LuaSnip" },
--  { "saadparwaiz1/cmp_llua/plugins/lsp/plugins.luauasnip" },
--  { "rafamadriz/friendly-snippets" },
--  { "windwp/nvim-autopairs" },
--  { "windwp/nvim-ts-autotag" },
--  { "lewis6991/gitsigns.nvim" },
--  { "tpope/vim-fugitive" },
--  { "tpope/vim-commentary" },
--  { "tpope/vim-surround" },
--  { "tpope/vim-repeat" },
--  { "tpope/vim-endwise" },
--  { "tpope/vim-dispatch" },
--  { "tpope/vim-eunuch" },
--  { "tpope/vim-unimpaired" },
--  { "tpope/vim-sleuth" },
--  { "tpope/vim-sensible" },
--  { "tpope/vim-rails" },
--  { "tpope/vim-rhubarb" },
--  { "tpope/vim-ragtag" },
--  { "tpope/vim-bundler" },
--  { "tpope/vim-rsi" },
--  { "tpope/vim-ragtag" },
--  { "tpope/vim-rails" },
--  { "tpope/vim-fugitive" },
--  { "tpope/vim-rhubarb" },
--  { "tpope/vim-ragtag" },
--  { "tpope/vim-rsi" },

  -- Normal plugins, unlike the ones above
  
--  { "nvim-treesitter/nvim-treesitter" },
--  { "nvim-telescope/telescope-fzf-native.nvim" },
--  { "nvim-tree/nvim-web-devicons" },

  -- A native neovim extension for Codeium
  {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        -- "hrsh7th/nvim-cmp",
    },
  },

--  {
--    "Exafunction/codeium.nvim",
--    dependencies = {
--        "nvim-lua/plenary.nvim",
--        "hrsh7th/nvim-cmp",
--    },
--    config = function()
--        require("codeium").setup({
--          virtual_text = {
--            enabled = true
--          }
--        })
--    end
--  },

  -- Preview markdown code directly in your neovim terminal. 
  -- {"ellisonleao/glow.nvim", config = true, cmd = "Glow"}

 -- { "nvim-telescope/telescope.nvim" },
}
