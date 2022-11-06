local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)

	-- plugin manager
	use 'wbthomason/packer.nvim'

	-- lazy loading plugins
	use 'lewis6991/impatient.nvim'

	-- lua library
	use 'nvim-lua/plenary.nvim'

	-- keymap popup
	use 'folke/which-key.nvim'

	-- sqls helper
	use 'nanotee/sqls.nvim'

	-- completion types / sources
	use "onsails/lspkind.nvim"

	-- go specific commands
	use 'fatih/vim-go'

	-- colorschemes
	use 'drewma2k/nvim-base16'
	-- use 'RRethy/nvim-base16'

	-- focus mode
	use({
		"Pocco81/true-zen.nvim",
		config = function()
			require("true-zen").setup({})
		end,
	})

	-- tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		tag = 'nightly' -- optional, updated every week. (see issue #1193)
	}

	-- better tabline
	use 'mkitt/tabline.vim'

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

	-- official lsp configurations
	use 'neovim/nvim-lspconfig'

	-- better syntax highlighting
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- completion engine
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'

	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	-- dashboard
	use {
		'goolord/alpha-nvim',
		config = function()
			require 'alpha'
		end
	}

	-- popup search menu
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	-- snippets
	use 'honza/vim-snippets'

	-- auto close (, [, etc
	use 'windwp/nvim-autopairs'

	-- git wrapper
	use 'tpope/vim-fugitive'

	use {
		"smjonas/live-command.nvim",
		-- live-command supports semantic versioning via tags
		-- tag = "1.*",
		config = function()
			require("live-command").setup {
				commands = {
					Norm = { cmd = "norm" },
				},
			}
		end,
	}

	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig'

	-- automatic installation of packer
	if packer_bootstrap then
		require('packer').sync()
	end

end)
