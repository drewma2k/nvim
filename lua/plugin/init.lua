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
  use({ "yioneko/nvim-yati", requires = "nvim-treesitter/nvim-treesitter" })

  use {
    'crispgm/nvim-tabline',
    config = function()
      require('tabline').setup({})
    end,
  }
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

-- lualine
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = '', right = '' },
    section_separators = { left = ' ', right = ' ' },
    disabled_filetypes = { 'NvimTree' },
    always_divide_middle = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'diff', 'diagnostics' },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { 'filename' },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
