return {
	{
		"mistweaverco/kulala.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons"
		},
		enabled = true,
		keys = {
			{ "<leader>Rs", desc = "Send request" },
			{ "<leader>Ra", desc = "Send all requests" },
			{ "<leader>Rb", desc = "Open scratchpad" }
		},
		ft = { "http", "rest" },
		opts = {
			global_keymaps = true,
			global_keymaps_prefix = "<leader>R",
			kulala_keymaps_prefix = "",
			ui = {
				icons = {
					inlay = {
						loading = "󰔟",
						done = "󰄬",
						error = ""
					}
				}
			}
		},
	},
	{
		"Olical/conjure",
		enabled = false,
		init = function()
			vim.g.conjure_client_on_load = false
		end
	},
	{
		"rest-nvim/rest.nvim",
		enabled = false,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			opts = function(_, opts)
				opts.ensure_installed = opts.ensure_installed or {}
				table.insert(opts.ensure_installed, "http")
			end
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
	{
		'bullets-vim/bullets.vim',
		init = function()
			vim.g.bullets_outline_levels = { 'ROM', 'ABC', 'num', 'abs', 'rom', 'std-' }
		end
	},
	{ 'martinda/Jenkinsfile-vim-syntax' },
	{
		"eatgrass/maven.nvim",
		cmd = { "Maven", "MavenExec" },
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require('maven').setup({
				executable = "mvn",
				commands = {
					{ cmd = { "install", "-Dmaven.test.skip" }, desc = "Install without tests" },
					{ cmd = {"clean", "install"}, desc = "Clean Install"}
				}
			})
		end
	},
	-- sql helper
	{ 'tpope/vim-dadbod' },
	{ 'kristijanhusak/vim-dadbod-ui' },
	{ 'kristijanhusak/vim-dadbod-completion' },
}
