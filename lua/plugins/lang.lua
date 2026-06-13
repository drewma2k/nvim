return {
	{
		dir = vim.fn.stdpath('config') .. '/lua/plugins/local/fernflower/',
		opts = {
			decompiler = 'fernflower', -- cfr, procyon, fernflower
			provider = {
				fernflower = {
					bin = 'fernflower'
				}
			}
		}
	},
	{
		"yousefhadder/markdown-plus.nvim",
		enabled = false,
		ft = "markdown",
	},
	{
		"goerz/jupytext.nvim",
		opts = {}
	},
	{
		"benlubas/molten-nvim",
		version = "^1.0.0",
		build = ":UpdateRemotePlugins",
		init = function()
			vim.g.molten_output_win_max_height = 12
		end,
	},
	{
		"obsidian-nvim/obsidian.nvim",
		version = "*", -- recommended, use latest release instead of latest commit
		ft = "markdown",
		enabled = true,
		-- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
		-- event = {
		--   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
		--   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/*.md"
		--   -- refer to `:h file-pattern` for more examples
		--   "BufReadPre path/to/my-vault/*.md",
		--   "BufNewFile path/to/my-vault/*.md",
		-- },
		config = function (_, opts)
			opts.note_id_func = require("obsidian.builtin").title_id
			require('obsidian').setup(opts)
		end,
		---@module 'obsidian'
		---@type obsidian.config
		opts = {
			legacy_commands = false,
			footer = {
				enabled = false,
			},
			frontmatter = {
				enabled = true
			},
			link = {
				auto_update = true,
			},
			workspaces = {
				{
					name = "notes",
					path = "~/Documents/notes",
				},
				-- {
				--   name = "work",
				--   path = "~/vaults/work",
				-- },
			},

			-- see below for full list of options 👇
		},
	},
	{
		"davidmh/mdx.nvim",
		enabled = false,
		config = true,
		dependencies = { "nvim-treesitter/nvim-treesitter" }
	},
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
		'bullets-vim/bullets.vim',
		enabled = true,
		init = function()
			vim.g.bullets_outline_levels = { 'ROM', 'ABC', 'num', 'abc', 'rom', 'std-' }
			vim.g.bullets_custom_mappings = {
				{ 'imap', '<Tab>',   '<Plug>(bullets-demote)' },
				{ 'imap', '<S-Tab>', '<Plug>(bullets-promote)' },
			}
		end
	},
	{ 'martinda/Jenkinsfile-vim-syntax' },
	{
		'mfussenegger/nvim-jdtls',
		ft = { 'java' },
		dependencies = { 'mfussenegger/nvim-dap' },
	},
	{
		"eatgrass/maven.nvim",
		cmd = { "Maven", "MavenExec" },
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require('maven').setup({
				executable = "mvn",
				commands = {
					{ cmd = { "install", "-Dmaven.test.skip" }, desc = "Install without tests" },
					{ cmd = { "clean", "install" },             desc = "Clean Install" }
				}
			})
		end
	},
	-- sql helper
	{ 'tpope/vim-dadbod' },
	{ 'kristijanhusak/vim-dadbod-ui' },
	{ 'kristijanhusak/vim-dadbod-completion' },
}
