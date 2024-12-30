return {
	{
		"zbirenbaum/copilot.lua",
		enabled = false,
		opts = {
			panel = {
				enabled = true,
				auto_refresh = true,
				keymap = {
					jump_prev = "[[",
					jump_next = "]]",
					accept = "<CR>",
					refresh = "gr",
					open = "<M-CR>"
				},
				layout = {
					position = "bottom", -- | top | left | right
					ratio = 0.4
				},
			},
			suggestion = {
				enabled = true,
				auto_trigger = false,
				debounce = 75,
				keymap = {
					accept = "<C-;>",
					accept_word = "<C-l>",
					-- accept_line = "<C-;>",
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
			filetypes = {
				yaml = false,
				markdown = function()
					if vim.fn.expand("%:t") == "README.md" then return true end
					return false
				end,
				help = false,
				gitcommit = false,
				gitrebase = false,
				hgcommit = false,
				svn = false,
				cvs = false,
				["."] = false,
			},
			copilot_node_command = 'node', -- Node.js version must be > 18.x
			server_opts_overrides = {},
		},
		init = function()
			vim.g.copilot_proxy = "http://entproxy.kdc.capitalone.com:8099"
		end
	},
	{
		'CopilotC-Nvim/CopilotChat.nvim',
		branch = 'main',
		version = '3.2.0',
		enabled = true,
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim"
		},
		keys = {
			{
				"<leader>cp",
				function()
					require('CopilotChat').open({ window = { width = 0.33 } })
				end,
				desc = "open chat"
			}
		},
		opts = {
			window = {
				width = 0.25,
			},
			mappings = {
				reset = {
					normal = ""
				}
			}
		}
	},
}
