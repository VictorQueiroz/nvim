return {
  -- 🪨 A collection of contrast-based Vim/Neovim colorschemes.
  { "zenbones-theme/zenbones.nvim" },

  -- Lua port of the most famous vim colorscheme
  { "ellisonleao/gruvbox.nvim" },

  -- 
  { "rktjmp/lush.nvim" },

  -- A 24bit colorscheme for Vim, Airline and Lightline.
  { "jacoborus/tender.vim" },

  -- Lualine theme for using with light background.
  { "yorik1984/lualine-theme.nvim" },

  {
    "michaelb/sniprun",
    branch = "master",

    build = "sh install.sh 1",
    -- do 'sh install.sh 1' if you want to force compile locally
    -- (instead of fetching a binary from the github release). Requires Rust >= 1.65

    config = function()
      require("sniprun").setup({
      -- your options
      })
    end,
  },

  -- vscode-like pictograms for neovim lsp completion items
  { "onsails/lspkind.nvim" },

  -- A colorscheme picker with live preview and persistence for neovim ✨
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("themery").setup({
        -- add the config here
      })
    end
  },

  -- Colorscheme for Neovim written in Lua, specially made for roshnivim with Tree-sitter support.
  { "shaeinst/roshnivim-cs" },

  -- Customizable colorscheme with excellent italic and bold support, dark and light variants. Made to work and look good with Tree-sitter.
  { "rafamadriz/neon" },

  -- A dark color scheme heavily inspired by the look of the Dark+ scheme of Visual Studio Code.
  { "tomasiser/vim-code-dark" },

  -- A Lua port of vim-code-dark colorscheme for Neovim with vscode light and dark theme.
  { "Mofiqul/vscode.nvim" },

  -- Material.nvim is a highly configurable colorscheme written in Lua and based on the material palette.
  { "marko-cerovac/material.nvim" },

  -- Nightfly is a dark GUI color scheme heavily inspired by Sarah Drasner's Night Owl theme.
  { "bluz71/vim-nightfly-guicolors" },

  -- Moonfly is a dark color scheme with Tree-sitter support.
  { "bluz71/vim-moonfly-colors" },

  -- Nvcode, onedark, nord colorschemes with Tree-sitter support.
  { "ChristianChiarulli/nvcode-color-schemes.vim" },

  -- A clean, dark and light Neovim theme written in Lua, with support for LSP, Tree-sitter and lots of plugins.
  { "folke/tokyonight.nvim" },

  -- High Contrast & Vivid Color Scheme based on Monokai Pro.
  { "sainnhe/sonokai" },

  -- A dark color scheme for Neovim derived from palenight and carbonight.
  { "kyazdani42/blue-moon" },

  -- Oceanic Next theme for Neovim.
  { "mhartington/oceanic-next" },

  -- A dark colorscheme with Tree-sitter support.
  { "glepnir/zephyr-nvim" },

  -- A colorscheme for Neovim with handcrafted support for LSP, Tree-sitter.
  { "rockerBOO/boo-colorscheme-nvim" },

  -- A port of the great Atom theme. Dark and light with Tree-sitter support.
  { "jim-at-jibba/ariake-vim-colors" },

  -- Light and dark atom one theme.
  { "Th3Whit3Wolf/onebuddy" },

  -- A dark colorscheme for Neovim written in Lua.
  { "RishabhRD/nvim-rdark" },

  -- This is a color scheme developed by Protesilaos Stavrou for emacs.
  { "ishan9299/modus-theme-vim" },

  -- Clean & Elegant Color Scheme inspired by Atom One and Material.
  { "sainnhe/edge" },

  -- Vim-deus with Tree-sitter support.
  { "theniceboy/nvim-deus" },

  -- Gloom inspired theme for Neovim.
  { "bkegley/gloombuddy" },

  -- An Atom One inspired dark and light colorscheme for Neovim.
  { "Th3Whit3Wolf/one-nvim" },

  -- A Neovim colorscheme write in Lua.
  { "PHSix/nvim-hybrid" },

  -- A spacemacs inspired dark and light colorscheme for Neovim.
  { "Th3Whit3Wolf/space-nvim" },

  -- Omni color scheme for Vim.
  { "yonlu/omni.vim" },

  -- A 24-bit dark theme with Tree-sitter and LSP support.
  { "ray-x/aurora" },

  -- Colorscheme for Neovim.
  { "novakne/kosmikoa.nvim" },

  -- Monokai theme for Neovim written in Lua.
  { "tanvirtin/monokai.nvim" },

  -- Neovim colorscheme based on your xresources color.
--  { "nekonako/xresources-nvim" },

  -- A Neovim colorscheme that uses your Xresources colors
  {
    'martineausimon/nvim-xresources',
    lazy = false,
    priority = 1000,
    config = function()
      require('nvim-xresources').setup({
      --  Optional config:
      --  xresources_path = os.getenv("HOME") .. '/.Xresources',
      --  auto_light = {
      --    enable = true,
      --    value = 0.5,
      --    exclude = {},
      --  },
      --  contrast = 1,
      --  bold = true,
      --  palette_overrides = {},
      --  fallback_theme = "nord"
      })
      --local C = require('nvim-xresources.colors')
      --require('nvim-xresources').custom_highlight_groups({ })

      vim.cmd('colorscheme xresources')
    end
  },

  -- Dark color scheme for Neovim and Vim 🗡️.
  { "savq/melange" },

  -- Neovim plugin for building base16 colorschemes. Includes support for Treesitter and LSP highlight groups.
  { "RRethy/nvim-base16" },

  -- A colour scheme for terminals, Vim and friends.
  { "fenetikm/falcon" },

  -- A nord-esque colorscheme using colorbuddy.nvim.
  { "maaslalani/nordbuddy" },

  -- Neovim theme based off of the Nord Color Palette.
  { "shaunsingh/nord.nvim" },

  -- My own Neovim colorscheme.
  { "MordechaiHadad/nvim-papadark" },

  -- Solarized colorscheme in Lua for Neovim 0.5.
  { "ishan9299/nvim-solarized-lua" },

  -- Port of VSCode's Moonlight colorscheme for NeoVim, written in Lua with built-in support for native LSP, Tree-sitter and many more plugins.
  { "shaunsingh/moonlight.nvim" },

  -- A One Dark Theme for Neovim 0.5 written in Lua based on Atom's One Dark Theme.
  { "navarasu/onedark.nvim" },

  -- GitHub colors leveraging Tree-sitter to get 100% accuracy.
  { "lourenci/github-colors" },

  -- Gruvbox modification with softer contrast and Tree-sitter support.
  { "sainnhe/gruvbox-material" },

  -- A green based colorscheme designed to be warm, soft and easy on the eyes.
  { "sainnhe/everforest" },

  -- Lua port of doom-emacs' doom-one for Neovim.
  { "NTBBloodbath/doom-one.nvim" },

  -- Famous beautiful dark powered theme.
  { "dracula/vim" },

  -- A port of VSCode Calvara Dark Theme to Neovim with Tree-sitter and many other plugins support.
  { "yashguptaz/calvera-dark.nvim" },

  -- A dark Neovim colorscheme written in Lua. Support built-in LSP and Tree-sitter.
  { "nxvu699134/vn-night.nvim" },

  -- Codeschool colorscheme for Neovim written in Lua with Tree-sitter and built-in lsp support.
  { "adisen99/codeschool.nvim" },

  -- A GitHub theme for Neovim, kitty, alacritty written in Lua. Support built-in LSP and Tree-sitter.
  { "projekt0n/github-nvim-theme" },

  -- A 16 bit monochrome colorscheme that uses hsluv for perceptually distinct gray colors, with support for Tree-sitter and other commonly used plugins.
  { "kdheepak/monochrome.nvim" },

  -- All natural pine, faux fur and a bit of soho vibes for the classy minimalist.
  { "rose-pine/neovim" },

  -- A collection of vim/neovim colorschemes designed to highlight code using contrasts and font variations.
  { "mcchrish/zenbones.nvim" },

  -- Warm mid-tone dark theme to show off your vibrant self! with support for native LSP, Tree-sitter, and more 🍨!
  { "catppuccin/nvim" },

  -- A dark, yet vibrant colorscheme for Neovim.
  { "FrenzyExists/aquarium-vim" },

  -- A soft dark, fully customizable Neovim theme, with support for lsp, treesitter and a variety of plugins.
  { "EdenEast/nightfox.nvim" },

  -- A cold, dark color scheme for Neovim written in Lua ported from arzg/vim-substrata theme.
  { "kvrohit/substrata.nvim" },

  -- A minimal Vim theme for night time. Loosely based on vim-monotonic and chrome's dark reader extention. A light theme is included as well for the day time.
  { "ldelossa/vimdark" },

  -- A beautiful and dark vim colorscheme written in vimscript.
  { "mangeshrex/uwu.vim" },

  -- Colorscheme for Neovim written in Lua based on the Apprentice color pattete with Tree-sitter and built-in lsp support.
  { "adisen99/apprentice.nvim" },

  -- One Dark Pro theme for Neovim, written in Lua and based on the VS Code theme. Includes dark and light themes with completely customisable colors, styles and highlights.
  { "olimorris/onedarkpro.nvim" },

  -- A Neovim theme that combines the Nord and Atom One Dark color palettes for a more vibrant programming experience.
  { "rmehri01/onenord.nvim" },

  -- Gruvbuddy without colorbuddy using Lush.
  { "RishabhRD/gruvy" },

  -- Color scheme of echasnovski/mini.nvim which is a variant of base16 with accent colors chosen according to optimal perceptual uniformity.
  { "echasnovski/mini.nvim" },

  -- A high-performance color highlighter which has no external dependencies!.
  { "NvChad/nvim-colorizer.lua" },

  -- Customizable colorscheme with excellent italic and bold support, dark and light variants. Made to work and look good with Tree-sitter.
  { "rafamadriz/neon" },

  -- A Neovim theme that highly restores vscode, so that your friends will no longer be surprised that you use Neovim, because they will think you are using vscode.
  { "askfiy/visual_studio_code" },

  -- A high-performance color highlighter which has no external dependencies!.
  { "NvChad/nvim-colorizer.lua" },

  -- Customizable colorscheme with excellent italic and bold support, dark and light variants. Made to work and look good with Tree-sitter.
  { "rafamadriz/neon" },

  -- Material.nvim is a highly configurable colorscheme written in Lua and based on the material palette.
  { "marko-cerovac/material.nvim" },

  -- A dark midnight colorscheme with modern Neovim support including Tree-sitter.
  { "bluz71/vim-nightfly-colors" },

  -- A dark charcoal colorscheme with modern Neovim support including Tree-sitter.
  { "bluz71/vim-moonfly-colors" },

  -- Solarized colorscheme in Lua (Neovim >= 0.5).
  { "ishan9299/nvim-solarized-lua" },

  -- 🦊A highly customizable theme for vim and neovim with support for lsp, treesitter and a variety of plugins.
  { "EdenEast/nightfox.nvim" },
}
