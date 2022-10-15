-- Bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end

require('packer').startup(function(use)

  -- colorscheme
  --use 'morhetz/gruvbox'

  -- sqls helper
  use 'nanotee/sqls.nvim'


  -- plugin manager
  use 'wbthomason/packer.nvim'

  use 'lewis6991/impatient.nvim'

  -- lua library
  use 'nvim-lua/plenary.nvim'


  -- LSP client hooks
 --  use {
	--   "jose-elias-alvarez/null-ls.nvim",
	--   require("null-ls").setup({
	-- 	sources = {
	-- 		require("null-ls").builtins.formatting.stylua,
	-- 		require("null-ls").builtins.diagnostics.eslint,
	-- 		-- require("null-ls").builtins.completion.spell,
	-- 		require("null-ls").builtins.diagnostics.golangci_lint.with({
	-- 			diagnostic_config = {
	-- 				virtual_text = true
	-- 			}
	-- 		})
	-- 	},
	-- })
 --  }

  -- go ide
  use 'fatih/vim-go'

  -- colorschemes
  use 'drewma2k/nvim-base16'

  -- focus mode
  use({
	"Pocco81/true-zen.nvim",
	config = function()
		 require("true-zen").setup {
			-- your config goes here
			-- or just leave it empty :)
		 }
	end,
  })

  -- tree
  --use { 'ms-jpq/chadtree', { branch = 'chad', run = 'python3 -m chadtree deps' } }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }

  -- fix tabbing
  -- use({ "yioneko/nvim-yati", requires = "nvim-treesitter/nvim-treesitter" })

  -- tabline
  use 'mkitt/tabline.vim'

  -- keymap popup
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

  -- comment shortcut
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- lsp install popup
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }

  -- better syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- completion engine
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  -- use 'hrsh7th/cmp-vsnip'
  -- use 'hrsh7th/vim-vsnip'

  -- for python snippets
  use 'cstrap/python-snippets'

  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'

  -- dashboard
  use {
    'goolord/alpha-nvim',
    config = function()
      require 'config.plugin.alpha'
    end
  }

  -- popup search menu
  use {
    'nvim-telescope/telescope.nvim',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- snippets
  use 'honza/vim-snippets'

  -- org mode
  -- use {
  --   "nvim-neorg/neorg",
  --   config = function()
  --     require('neorg').setup {
  --       load = {
  --         ["core.defaults"] = {},
  --         ["core.gtd.base"] = {
  --           config = {
  --             workspace = "test"
  --           }
  --         }
  --       }
  --     }
  --   end,
  --   requires = "nvim-lua/plenary.nvim"
  -- }

  -- better indenting
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  -- use 'Darazaki/indent-o-matic'
  -- if packer_bootstrap then
  --   require('packer').sync()
  -- end

  -- auto close (, [, etc
  use 'windwp/nvim-autopairs'
end)

-- plugin setups that don't deserve their own file

--indent-o-matic
-- require('indent-o-matic').setup {
--   -- The values indicated here are the defaults
--
--   -- Number of lines without indentation before giving up (use -1 for infinite)
--   max_lines = 2048,
--
--   -- Space indentations that should be detected
--   standard_widths = { 2, 4, 8 },
-- }

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

require('config.plugin.lualine')
require('config.plugin.lspconfig')
require('config.plugin.treesitter')
require('config.plugin.cmp')
require('config.plugin.nvim-tree')
require('luasnip.loaders.from_snipmate').lazy_load()
