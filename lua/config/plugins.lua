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

	-- sql helper
	use 'tpope/vim-dadbod'
	use 'kristijanhusak/vim-dadbod-ui'

	-- completion types / sources
	use "onsails/lspkind.nvim"

	-- go specific commands
	use 'fatih/vim-go'

	-- colorschemes
	use { "ellisonleao/gruvbox.nvim" }
	use 'rebelot/kanagawa.nvim'
	-- use 'drewma2k/nvim-base16'
	use 'EdenEast/nightfox.nvim'
	use 'bluz71/vim-moonfly-colors'
	-- use 'RRethy/nvim-base16'
	-- use 'altercation/vim-colors-solarized'
	-- use 'tjdevries/colorbuddy.nvim'
	-- use { 'svrana/neosolarized.nvim' }
	-- use 'ishan9299/nvim-solarized-lua'
	use 'folke/tokyonight.nvim'
	use { "catppuccin/nvim", as = "catppuccin" }
	use 'navarasu/onedark.nvim'
	use {
		'zenbones-theme/zenbones.nvim',
		requires = "rktjmp/lush.nvim"
	}
	-- use 'sainnhe/everforest'


	-- tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		-- tag = 'nightly'            -- optional, updated every week. (see issue #1193)
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
		-- tag = "v0.9.0",
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
	use 'kristijanhusak/vim-dadbod-completion'

	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'

	-- dashboard
	use 'goolord/alpha-nvim'

	-- popup search menu
	use {
		'nvim-telescope/telescope.nvim',
		requires = { { 'nvim-lua/plenary.nvim' } },
		-- commit = "05f4d6f0a9ec1aa35816c34c52b6f8578511b434"
		version = "0.1.8"
	}
	-- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

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

	-- use { 'kosayoda/nvim-lightbulb',
	-- 	requires = 'antoinemadec/FixCursorHold.nvim'
	-- }

	-- use a branch while the deprecated fix is not merged
	use { 'lvim-tech/nvim-lightbulb',
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

	-- use { 'jalvesaq/Nvim-R' }

	-- mini library
	use 'echasnovski/mini.nvim'

	use 'luukvbaal/statuscol.nvim'

	-- automatic installation of packer
	if packer_bootstrap then
		require('packer').sync()
	end

	use "lukas-reineke/indent-blankline.nvim"

	-- use {
	-- 	'pwntester/octo.nvim',
	-- 	requires = {
	-- 		'nvim-lua/plenary.nvim',
	-- 		'nvim-telescope/telescope.nvim',
	-- 		'nvim-tree/nvim-web-devicons',
	-- 	},
	-- 	config = function()
	-- 		require "octo".setup()
	-- 	end
	-- }

	use "christoomey/vim-tmux-navigator"

	-- use "chentoast/marks.nvim"

	-- broken for 0.10
	-- use { 'anuvyklack/pretty-fold.nvim',
	-- 	config = function()
	-- 		require('pretty-fold').setup()
	-- 	end
	-- }

	use { 'sheerun/vim-polyglot' }
	use 'martinda/Jenkinsfile-vim-syntax'

	use {
		"zbirenbaum/copilot.lua",
		-- cmd = "Copilot",
		-- -- event = "InsertEnter",
	}

	use {
		'CopilotC-Nvim/CopilotChat.nvim',
		requires = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim"
		},
	}

	use {
		"zbirenbaum/copilot-cmp",
		-- after = { "copilot.lua" },
	}

	-- use 'ixru/nvim-markdown'
	-- use 'godlygeek/tabular'
	-- use 'preservim/vim-markdown'

	use "hedyhli/outline.nvim"

	use "mfussenegger/nvim-jdtls"

	-- use({
	-- 	'MeanderingProgrammer/markdown.nvim',
	-- 	as = 'render-markdown',                         -- Only needed if you have another plugin named markdown.nvim
	-- 	after = { 'nvim-treesitter' },
	-- 	-- requires = { 'echasnovski/mini.nvim', opt = true }, -- if you use the mini.nvim suite
	-- 	-- requires = { 'echasnovski/mini.icons', opt = true }, -- if you use standalone mini plugins
	-- 	requires = { 'nvim-tree/nvim-web-devicons', opt = true }, -- if you prefer nvim-web-devicons
	-- 	config = function()
	-- 		require('render-markdown').setup({})
	-- 	end,
	-- })

	use {
		"OXY2DEV/markview.nvim",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		}
	}
	--

	use 'opdavies/toggle-checkbox.nvim'

	use 'dhruvasagar/vim-table-mode'

	-- use {
	-- 	'nvim-java/nvim-java',
	-- 	requires = {
	-- 		'nvim-java/nvim-java-refactor',
	-- 		'nvim-java/nvim-java-core',
	-- 		'nvim-java/nvim-java-test',
	-- 		'nvim-java/nvim-java-dap',
	-- 		'JavaHello/spring-boot.nvim',
	-- 		'nvim-java/lua-async-await',
	-- 		'MunifTanjim/nui.nvim',
	--
	-- 	}
	-- }
	--    use 'nvim-java/nvim-java-refactor'
	--    use 'nvim-java/nvim-java-core'
	--    use 'nvim-java/nvim-java-test'
	--    use 'nvim-java/nvim-java-dap'
	--    -- use 'nvim-java/nvim-java'
	--    use 'JavaHello/spring-boot.nvim'
	-- use	'nvim-java/lua-async-await'
	-- use 'MunifTanjim/nui.nvim'
	use 'bullets-vim/bullets.vim'
end)
