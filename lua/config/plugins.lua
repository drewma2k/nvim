local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
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
	use 'numToStr/Comment.nvim'

	-- statusline
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}

	-- official lsp configurations
	use 'neovim/nvim-lspconfig'

	-- better syntax highlighting
	use { 'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}

	-- completion engine
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lua'
	use 'hrsh7th/cmp-nvim-lsp-signature-help'

	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	-- dashboard
	use 'goolord/alpha-nvim'

	-- popup search menu
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- snippets
	use 'honza/vim-snippets'

	-- auto close (, [, etc
	use 'windwp/nvim-autopairs'

	-- git wrapper
	use 'tpope/vim-fugitive'

	use "smjonas/live-command.nvim"

	use 'williamboman/mason.nvim'
	use 'williamboman/mason-lspconfig'

	use 'stevearc/dressing.nvim'

	use { 'kosayoda/nvim-lightbulb',
		requires = 'antoinemadec/FixCursorHold.nvim'
	}

	use 'mfussenegger/nvim-dap'
	use 'rcarriga/nvim-dap-ui'
	use 'leoluz/nvim-dap-go'

	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

	use { 'lewis6991/gitsigns.nvim' }

	-- better quickfix
	use {
		"folke/trouble.nvim",
		requires = "nvim-tree/nvim-web-devicons"
	}

	use { "jose-elias-alvarez/null-ls.nvim" }

	use { 'jalvesaq/Nvim-R' }

	-- automatic installation of packer
	if packer_bootstrap then
		require('packer').sync()
	end

end)
