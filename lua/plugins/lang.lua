return {
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
	{
		'bullets-vim/bullets.vim',
		lazy = 'BufEnter *.md',
		-- init = function()
		-- 	-- disable default mappings
		-- 	vim.g.bullets_set_mappings = 0
		-- end,
		-- keys = {
		-- 	{ '<cr>',   '<Plug>(bullets-newline)',  mode = 'i' },
		-- 	{ '<C-cr>', '<cr>',                     mode = 'i' }, -- remap false?
		-- 	{ 'o',      '<Plug>(bullets-newline)',  mode = 'n' },
		-- 	{ 'gN',     '<Plug>(bullets-renumber)', mode = 'v' },
		-- 	{ 'gN',     '<Plug>(bullets-renumber)', mode = 'n' },
		-- 	{ '<C-t>',  '<Plug>(bullets-demote)',   mode = 'i' },
		-- 	{ '>>',     '<Plug>(bullets-demote)',   mode = 'n' },
		-- 	{ '>',      '<Plug>(bullets-demote)',   mode = 'v' },
		-- 	{ '<C-d>',  '<Plug>(bullets-promote)',  mode = 'i' },
		-- 	{ '<<',     '<Plug>(bullets-promote)',  mode = 'n' },
		-- 	{ '<',      '<Plug>(bullets-promote)',  mode = 'v' },
		-- }
	},
	{
		'nvim-java/nvim-java',
		config = false, -- for some reason, setup here does not work
		-- opts = {
		-- 	notifications = {
		-- 		dap = false,
		-- 	},
		-- 	spring_boot_tools = {
		-- 		enable = false
		-- 	},
		-- 	jdk = {
		-- 		auto_install = false
		-- 	}
		-- }
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
					{ cmd = { "install", "-Dmaven.test.skip" }, desc = "Install without tests" }
				}
			})
		end
	},
	-- Bogiefiles
	{
		"https://github.cloud.capitalone.com/forecast/vim",
		optional = true
	},
	-- sql helper
	{ 'tpope/vim-dadbod' },
	{ 'kristijanhusak/vim-dadbod-ui' },
	{ 'kristijanhusak/vim-dadbod-completion' },
}
