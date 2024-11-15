return {

	-- lua library
	{
		'nvim-lua/plenary.nvim'
	},

	-- keymap popup
	{
		'folke/which-key.nvim'
	},

	-- sql helper
	{
		'tpope/vim-dadbod'
	},
	{
		'kristijanhusak/vim-dadbod-ui'
	},

	-- completion types / sources
	{
		"onsails/lspkind.nvim"
	},

	-- go specific commands
	-- use 'fatih/vim-go'

	-- colorschemes
	{
		"ellisonleao/gruvbox.nvim"
	},
	{
		'rebelot/kanagawa.nvim'
	},
	-- use 'drewma2k/nvim-base16'
	{
		'EdenEast/nightfox.nvim'
	},
	{
		'bluz71/vim-moonfly-colors'
	},
	{
		'folke/tokyonight.nvim'
	},
	{
		"catppuccin/nvim",
		name = "catppuccin"
	},
	{
		'navarasu/onedark.nvim'
	},
	{
		'zenbones-theme/zenbones.nvim',
		dependencies = "rktjmp/lush.nvim"
	},

	-- tree
	{
		'kyazdani42/nvim-tree.lua',
		dependencies = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		-- tag = 'nightly'            -- optional, updated every week. (see issue #1193)
	},

	-- better tabline
	{
		'mkitt/tabline.vim'
	},

	-- comment shortcut
	{
		'numToStr/Comment.nvim'
	},

	-- statusline
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons', opt = true }
	},

	-- official lsp configurations
	{
		'neovim/nvim-lspconfig'
	},

	-- better syntax highlighting
	{
		'nvim-treesitter/nvim-treesitter',
		-- version = "v0.9.0",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "python" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},

	-- completion engine
	{
		'hrsh7th/cmp-nvim-lsp'
	},
	{
		'hrsh7th/cmp-buffer'
	},
	{
		'hrsh7th/cmp-path'
	},
	{
		'hrsh7th/cmp-cmdline'
	},
	{
		'hrsh7th/nvim-cmp'
	},
	{
		'hrsh7th/cmp-nvim-lua'
	},
	{
		'hrsh7th/cmp-nvim-lsp-signature-help'
	},
	{
		'kristijanhusak/vim-dadbod-completion'
	},

	{
		'L3MON4D3/LuaSnip'
	},
	{
		'saadparwaiz1/cmp_luasnip'
	},

	-- dashboard
	{
		'goolord/alpha-nvim'
	},

	-- popup search menu
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { { 'nvim-lua/plenary.nvim' } },
		-- commit = "05f4d6f0a9ec1aa35816c34c52b6f8578511b434"
		version = "0.1.8"
	},
	-- use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

	-- snippets
	{
		'honza/vim-snippets'
	},

	-- auto close (, [, etc
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {
			disable_filetype = { "TelescopePrompt", "markdown" },
		}
	},

	-- git wrapper
	{
		'tpope/vim-fugitive'
	},

	{
		"smjonas/live-command.nvim"
	},

	{
		'williamboman/mason.nvim',
		-- opts = {
		-- 	PATH = 'append',
		-- 	providers = {
		-- 		"mason.providers.registry-api",
		-- 		"mason.providers.client",
		-- 	},
		-- 	registries = {
		-- 		'github:mason-org/mason-registry',
		-- 	},
		-- 	log_level = vim.log.levels.DEBUG,
		-- }

	},
	{
		'williamboman/mason-lspconfig'
	},

	{
		'stevearc/dressing.nvim',
		opts = {
			input = {
				relative = "editor"
			}
		}
	},

	-- use { 'kosayoda/nvim-lightbulb',
	-- 	requires = 'antoinemadec/FixCursorHold.nvim'
	-- }

	-- use a branch while the deprecated fix is not merged
	{
		'lvim-tech/nvim-lightbulb',
		dependencies = 'antoinemadec/FixCursorHold.nvim'
	},

	{
		'mfussenegger/nvim-dap',
		dependencies = "nvim-neotest/nvim-nio"
	},
	{
		'rcarriga/nvim-dap-ui'
	},
	{
		'leoluz/nvim-dap-go'
	},

	{
		'sindrets/diffview.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function()
			local ok, diffview = pcall(require, "diffview")
			if not ok then
				return
			end
			diffview.setup({
				view = {
					default = {
						-- layout = -1
					}
				}
			})
		end
	},

	{ 'lewis6991/gitsigns.nvim' },

	-- better quickfix
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons"
	},

	{
		"jose-elias-alvarez/null-ls.nvim"
	},

	-- use { 'jalvesaq/Nvim-R' }

	-- mini library
	{
		'echasnovski/mini.nvim'
	},

	{
		'luukvbaal/statuscol.nvim'
	},

	{
		"lukas-reineke/indent-blankline.nvim"
	},

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

	{
		"christoomey/vim-tmux-navigator"
	},

	-- use "chentoast/marks.nvim"

	-- broken for 0.10
	-- use { 'anuvyklack/pretty-fold.nvim',
	-- 	config = function()
	-- 		require('pretty-fold').setup()
	-- 	end
	-- }

	{
		'sheerun/vim-polyglot'
	},
	{
		'martinda/Jenkinsfile-vim-syntax'
	},

	{
		-- "zbirenbaum/copilot.lua",
		-- using fork, because auto_trigger without input is broken
		"jsongerber/copilot.lua"
	},

	{
		'CopilotC-Nvim/CopilotChat.nvim',
		dependencies = {
			"jsongerber/copilot.lua",
			"nvim-lua/plenary.nvim"
		},
	},

	-- use {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	-- after = { "copilot.lua" },
	-- }

	-- use 'ixru/nvim-markdown'
	-- use 'godlygeek/tabular'
	-- use 'preservim/vim-markdown'

	{
		"hedyhli/outline.nvim"
	},

	-- {
	-- 	"mfussenegger/nvim-jdtls"
	-- },

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

	{
		"OXY2DEV/markview.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		}
	},
	--

	{
		'opdavies/toggle-checkbox.nvim'
	},

	{
		'dhruvasagar/vim-table-mode'
	},

	{
		'nvim-java/nvim-java'
	},

	{
		'gaoDean/autolist.nvim',
		ft = "markdown",
		config = function()
			require("autolist").setup()
			vim.keymap.set("i", "<tab>", "<cmd>AutolistTab<cr>")
			vim.keymap.set("i", "<s-tab>", "<cmd>AutolistShiftTab<cr>")
			-- vim.keymap.set("i", "<c-t>", "<c-t><cmd>AutolistRecalculate<cr>") -- an example of using <c-t> to indent
			vim.keymap.set("i", "<CR>", "<CR><cmd>AutolistNewBullet<cr>")
			vim.keymap.set("n", "o", "o<cmd>AutolistNewBullet<cr>")
			vim.keymap.set("n", "O", "O<cmd>AutolistNewBulletBefore<cr>")
			vim.keymap.set("n", "<CR>", "<cmd>AutolistToggleCheckbox<cr><CR>")
			vim.keymap.set("n", "<C-r>", "<cmd>AutolistRecalculate<cr>")

			-- cycle list types with dot-repeat
			vim.keymap.set("n", "<leader>cn", require("autolist").cycle_next_dr, { expr = true })
			vim.keymap.set("n", "<leader>cp", require("autolist").cycle_prev_dr, { expr = true })

			-- if you don't want dot-repeat
			-- vim.keymap.set("n", "<leader>cn", "<cmd>AutolistCycleNext<cr>")
			-- vim.keymap.set("n", "<leader>cp", "<cmd>AutolistCycleNext<cr>")

			-- functions to recalculate list on edit
			vim.keymap.set("n", ">>", ">><cmd>AutolistRecalculate<cr>")
			vim.keymap.set("n", "<<", "<<<cmd>AutolistRecalculate<cr>")
			vim.keymap.set("n", "dd", "dd<cmd>AutolistRecalculate<cr>")
			vim.keymap.set("v", "d", "d<cmd>AutolistRecalculate<cr>")
		end
	},

	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},

	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-python",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter"
		},
		config = function()
			require('neotest').setup({
				adapters = {
					require("neotest-python")
				},
				output = {
					enabled = true,
					open_on_run = true
				}
			})
		end
	},
	{
		"MaximilianLloyd/ascii.nvim",
		dependencies = "MunifTanjim/nui.nvim"
	},

	{
		"eatgrass/maven.nvim",
		cmd = { "Maven", "MavenExec" },
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require('maven').setup({
				executable = "mvn",
				commands = {
					{ cmd = { "install", "-Dmaven.test.skip" }, desc = "Install without tests" }
				}
			})
		end
	},
	-- not ready
	-- {
	-- 	'saghen/blink.cmp',
	-- 	lazy = false, -- lazy loading handled internally
	-- 	-- optional: provides snippets for the snippet source
	-- 	dependencies = 'rafamadriz/friendly-snippets',
	--
	-- 	-- use a release tag to download pre-built binaries
	-- 	version = 'v0.*',
	-- 	-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- 	-- build = 'cargo build --release',
	-- 	-- If you use nix, you can build from source using latest nightly rust with:
	-- 	-- build = 'nix run .#build-plugin',
	--
	-- 	---@module 'blink.cmp'
	-- 	---@type blink.cmp.Config
	-- 	opts = {
	-- 		signature_help = {
	-- 			enabled = true
	-- 		},
	-- 		windows = {
	-- 			border = 'single'
	-- 		},
	-- 		-- 'default' for mappings similar to built-in completion
	-- 		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
	-- 		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
	-- 		-- see the "default configuration" section below for full documentation on how to define
	-- 		-- your own keymap.
	-- 		keymap = {
	-- 			preset = 'enter',
	-- 			["<Tab>"] = {
	-- 				'snippet_forward',
	-- 				'select_next',
	-- 				'fallback'
	--
	-- 			},
	-- 			["<S-Tab>"] = {
	-- 				'snippet_backward',
	-- 				'select_next',
	-- 				'fallback'
	-- 			}
	-- 		},
	--
	-- 		highlight = {
	-- 			-- sets the fallback highlight groups to nvim-cmp's highlight groups
	-- 			-- useful for when your theme doesn't support blink.cmp
	-- 			-- will be removed in a future release, assuming themes add support
	-- 			use_nvim_cmp_as_default = true,
	-- 		},
	-- 		-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
	-- 		-- adjusts spacing to ensure icons are aligned
	-- 		nerd_font_variant = 'mono',
	--
	-- 		-- experimental auto-brackets support
	-- 		-- accept = { auto_brackets = { enabled = true } }
	--
	-- 		-- experimental signature help support
	-- 		-- trigger = { signature_help = { enabled = true } }
	-- 	}
	-- },

	-- {
	-- 	'nvimdev/lspsaga.nvim',
	-- 	config = function()
	-- 		require('lspsaga').setup({
	-- 			symbol_in_winbar = false
	-- 		})
	-- 	end,
	-- 	dependencies = {
	-- 		'nvim-treesitter/nvim-treesitter', -- optional
	-- 		'nvim-tree/nvim-web-devicons', -- optional
	-- 	}
	-- }
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				}
			},
			presets = {
				-- bottom_search = true, -- use a classic bottom cmdline for search
				-- command_palette = true, -- position the cmdline and popupmenu together
				-- long_message_to_split = true, -- long messages will be sent to a split
				-- inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
			cmdline = {
				enabled = false
				-- view = "cmdline"
			},
			messages = {
				enabled = false,
				-- view = "mini"
			},
			notify = {
				enabled = false
				-- view = "mini"
			},
			hover = {
				silent = true
			},
			message = {
				view = "mini",
			},
			views = {
				mini = {
					position = {
						row = -2
					}
				}
			}
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		}
	},

	{
		"mfussenegger/nvim-dap-python",
	}
}
