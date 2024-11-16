return {
  -- The largest collection of independent JSON schemas in the world.
  { "b0o/SchemaStore.nvim" },

  -- Nodejs extension host for vim & neovim, load extensions like VSCode and host language servers.
  {
    "neoclide/coc.nvim",

    -- When the plugin is installed, run `npm ci` shell command inside the plugins folder
    -- in order to build the plugin. Otherwise, it won't work
    run = "npm ci",
    -- -- build = ":CocUpdate",
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*"
  },

  -- A better annotation generator. Supports multiple languages and annotation conventions.
  { 
    "danymat/neogen", 
    config = true,
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*" 
  },

  -- Completor is an asynchronous code completion framework for vim8.
  -- New features of vim8 are used to implement the fast completion engine with low overhead.
  -- For using semantic completion, external completion tools should be installed.
  -- { "maralla/completor.vim" },

  -- Code analysis & navigation plugin for Neovim. Navigate codes like a breeze🎐 Exploring LSP and 🌲Treesitter symbols a piece of 🍰 Take control like a boss 🦍
  -- { "ray-x/navigator.lua" },  
  -- { "liuchengxu/vista.vim" },
}
