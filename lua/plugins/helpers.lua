return {
  -- TL;DR
  -- Agenda view
  -- Search by tags/keyword
  -- Clocking time
  -- Repeatable dates, date and time ranges
  -- Capturing to default notes file/destination
  -- Archiving (archive file or ARCHIVE tag)
  -- Exporting (via emacs, pandoc and custom export options)
  -- Notifications (experimental, see issue #49)
  -- Calendar popup for easier navigation and date updates
  -- Various org file mappings:
  -- Promote/Demote
  -- Change TODO state
  -- Change dates
  -- Insert/Move/Refile headlines
  -- Change tags
  -- Toggle checkbox state
  -- Remote editing from agenda view
  -- Repeatable mapping via vim-repeat
  -- { "nvim-orgmode/orgmode" },

  -- Jump to any location specified by two characters.
  --
  -- Sneak is a powerful, reliable, yet minimal motion plugin for Vim. It works with multiple lines, operators (including repeat . and surround), motion-repeat (; and ,), keymaps, visual mode, multibyte text, and macros.
  --
  -- Try label-mode for a minimalist alternative to EasyMotion:
  -- { -- "justinmk/vim-sneak" },

  -- Establish good command workflow and quit bad habit.
  {
    "m4xshen/hardtime.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim"
    },
    opts = {}
  },



  -- Define your keymaps, commands, and autocommands as simple Lua tables,
  -- building a legend at the same time (like VS Code's Command Palette).
  -- { "mrjones2014/legendary.nvim" },

  -- 
--  {
--    "AckslD/nvim-FeMaco.lua",
--    config = function()
--      require("femaco").setup()
--    end,
--  },

  -- "On this day" style calendar, which provides information about worldwide history of working class movements and liberation struggles.
    { "aPeoplesCalendar/apc.nvim" },

    -- Neovim plugin that shows a popup with possible keybindings of the command you started typing. 
    {
      "folke/which-key.nvim",
      config = function()
        require("which-key").setup {
          -- your configuration comes here
          -- or leave it empty to use the default settings
          -- refer to the configuration section below
        }
      end
    },
}
