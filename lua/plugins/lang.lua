return {
	{
		"Olical/conjure",
		enabled = false,
		init = function ()
			vim.g.conjure_client_on_load = false
		end
	},
	{
		"rest-nvim/rest.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			opts = function (_, opts)
				opts.ensure_installed = opts.ensure_installed or {}
				table.insert(opts.ensure_installed, "http")
			end
		}
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python",
			{
				"nvim-telescope/telescope.nvim",
				-- branch = "0.1.x",
				dependencies = { "nvim-lua/plenary.nvim" }
			}
		},
		lazy = false,
		branch = "regexp",
		config = function()
			require("venv-selector").setup()
		end,
		keys = {
			{ ",v", "<cmd>VenvSelect<cr>" }
		}
	},
	{
		"nvim-neorg/neorg",
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		config = function()
			require('neorg').setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {},
					["core.dirman"] = {
						config = {
							default_workspace = 'notes',
							workspaces = {
								notes = "~/Documents/notes",
							}
						}
					},
					['core.journal'] = {
						config = {
							journal_folder = 'standup',
							workspace = 'notes',
							strategy = 'flat'
						}
					}
				}
			})

			vim.api.nvim_create_user_command('Standup', function()
				vim.cmd [[Neorg journal today]]
				vim.cmd [[split]]
				vim.cmd [[Neorg journal yesterday]]
				vim.cmd [[wincmd k]]
			end, {})
		end,
	},
	{'bullets-vim/bullets.vim'},
	{ 'martinda/Jenkinsfile-vim-syntax' },
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
	-- sql helper
	{ 'tpope/vim-dadbod' },
	{ 'kristijanhusak/vim-dadbod-ui' },
	{ 'kristijanhusak/vim-dadbod-completion' },
}
