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
				auto_trigger = true,
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
	},
	{
		"olimorris/codecompanion.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		init = function ()
			-- vim.keymap.set({"n", "v"}, "<C-a>", "<cmd>CodeCompanionActions<cr>", {noremap=true, silent=true})
			vim.keymap.set({"n", "v"}, "<LocalLeader>a", "<cmd>CodeCompanionChat Toggle<cr>", {noremap=true, silent=true})
			vim.keymap.set("v", "ga", "<cmd>CodeCompanionChat Add<cr>", {noremap=true, silent=true})
			vim.cmd([[cab cc CodeCompanion]])
		end,
		opts = {
			adapters = {
				opts = {
					allow_insecure = true,
					-- proxy = ""
				}
			},
			display = {
				chat = {
					window = {
						width = 0.25
					}
				},
				diff = {
					provider = "mini_diff"
				}
			},
			strategies = {
				chat = {
					adapter = {
						name = "openai",
						model = "gpt-4.1-mini"
					}
				},
				inline = {
					adapter = "openai"
				},
				agent = {
					adapter = "openai"
				},
			}

		}

	},
}
