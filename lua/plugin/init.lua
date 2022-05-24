-- Bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

require('packer').startup(function(use)
  -- My plugins here
  -- use {
  --   "phha/zenburn.nvim",
  --   config = function() require("zenburn").setup() end
  -- }
  use { 'ms-jpq/chadtree', { branch = 'chad', run = 'python3 -m chadtree deps' } }
  use 'nvim-lua/popup.nvim'
  use({ "yioneko/nvim-yati", requires = "nvim-treesitter/nvim-treesitter" })

  -- use {
  --   'crispgm/nvim-tabline',
  --   config = function()
  --     require('tabline').setup({})
  --   end,
  -- }
  use 'mkitt/tabline.vim'
  use {
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        plugins = {
          spelling = { enabled = true },
          presets = { operators = false },
        },
        window = {
          border = "rounded",
          padding = { 2, 2, 2, 2 },
        },
      }
    end
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'wbthomason/packer.nvim'
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'nvim-lua/plenary.nvim'
  use {
    'goolord/alpha-nvim',
    config = function()
      require 'config.plugin.alpha'
    end
  }
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  use 'Darazaki/indent-o-matic'
  if packer_bootstrap then
    require('packer').sync()
  end
  use 'windwp/nvim-autopairs'
end)

-- plugin setups that don't deserve their own file


--indent-o-matic
require('indent-o-matic').setup {
  -- The values indicated here are the defaults

  -- Number of lines without indentation before giving up (use -1 for infinite)
  max_lines = 2048,

  -- Space indentations that should be detected
  standard_widths = { 2, 4, 8 },
}

-- nvim-autopairs
require('nvim-autopairs').setup {
  {
    check_ts = true,
    ts_config = {
      lua = { "string", "source" },
      javascript = { "string", "template_string" },
      java = false,
    },
    disable_filetype = { "TelescopePrompt", "spectre_panel" },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
      offset = 0,
      end_key = "$",
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      check_comma = true,
      highlight = "PmenuSel",
      highlight_grey = "LineNr",
    },
  }
}

--vim.cmd[[colorscheme everforest]]
-- LUALINE
-- customize auto theme
local custom_auto_theme = require('lualine.themes.auto')

for mode, components in pairs(custom_auto_theme) do
  for component, _ in pairs(components) do
    if component ~= 'a' then
      custom_auto_theme[mode][component] = 'StatusLine'
      -- custom_auto_theme[mode][component].fg = ''
      -- custom_auto_theme[mode][component].bg = bg
      -- custom_auto_theme[mode][component].gui = 'bold,reverse'
    end
  end
  custom_auto_theme[mode].z = custom_auto_theme[mode].b
end
local mode = {
  function()
    return ""
  end,
  padding = { left = 0, right = 0 },
  cond = nil,
}
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = custom_auto_theme,
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    disabled_filetypes = { 'CHADTree' },
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {
      mode,
    },
    lualine_b = {
      {
        'filename',
        path = 0,

      },
      'branch',
      {
        'diagnostics',
        colored = false,
        diagnostics_color = {
          -- Same values as the general color option can be used here.
          error = { bg = "lightgrey", fg = 'red', gui = 'bold' }, --'DiagnosticError', -- Changes diagnostics' error color.
          warn  = { bg = "lightgrey", fg = 'darkorange', gui = 'bold' }, --'DiagnosticWarn',  -- Changes diagnostics' warn color.
          info  = { bg = "lightgrey", fg = 'blue', gui = 'bold' }, --'DiagnosticInfo',  -- Changes diagnostics' info color.
          hint  = { bg = "", fg = '', gui = 'bold,reverse' }, --'DiagnosticHint',  -- Changes diagnostics' hint color.
        }
      },
    },
    lualine_c = {
    },
    lualine_x = {
      {
        'fileformat',
        symbols = {
          unix = "",
          dos = "",
          mac = "",
        },
      },
      {
        'filetype',
        colored = false,
        color = 'StatusLine'
      }
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {
      {
        'filename',
        path = 1,

      },
    },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'nvim-tree' }
}
