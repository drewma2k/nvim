return {
	-- keymap popup
	{ 'folke/which-key.nvim' },
	{
		'kyazdani42/nvim-tree.lua',
		dependencies = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		-- tag = 'nightly'            -- optional, updated every week. (see issue #1193)
	},
	-- tabs with numbers and modified [+] icon
	{
		'mkitt/tabline.vim'
	},
	-- statusline
	{
		'nvim-lualine/lualine.nvim',
		dependencies = {
			'kyazdani42/nvim-web-devicons',
			opt = true
		}
	},
	-- dashboard
	{
		'goolord/alpha-nvim',
		dependencies = {
			"MaximilianLloyd/ascii.nvim"
		},
		config = function()
			local alpha = require('alpha')
			local dashboard = require('alpha.themes.dashboard')
			local ascii = require('ascii').art.planets.planets.saturn
			local hl = {}
			local rowhls = {}
			for i = 1, #ascii do
				for c = 1, #ascii[1] do
					-- if ascii[i]:sub(c, c) ~= "8" then
					if (";:-.,"):find(ascii[i]:sub(c, c), 1, true) then
						table.insert(rowhls, { "@keyword", c - 1, c })
					else
						table.insert(rowhls, { "@method", c - 1, c })
					end
				end
				if rowhls ~= {} then
					table.insert(hl, rowhls)
					rowhls = {}
				end
			end
			dashboard.section.header.val = ascii
			dashboard.section.header.opts.hl = hl

			alpha.setup(dashboard.opts)
		end
	},
	-- ascii images for dashboard
	{ "MaximilianLloyd/ascii.nvim", dependencies = "MunifTanjim/nui.nvim" },
	{
		"smjonas/live-command.nvim"
	},
	-- TODO: this does nothing right now
	-- {
	-- 	'lvim-tech/nvim-lightbulb',
	-- 	-- dependencies = 'antoinemadec/FixCursorHold.nvim'
	-- },
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons"
	},
	{ 'luukvbaal/statuscol.nvim' },
	{ "lukas-reineke/indent-blankline.nvim" },
	{ "hedyhli/outline.nvim" },
	{
		"OXY2DEV/markview.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
		opts = {
			initial_state = true,
			-- hybrid_modes = { 'n' },
			headings = {
				-- shift_width = 0,
				heading_1 = {
					style = 'simple',
				},
				heading_2 = {
					style = 'simple'
				},
				heading_3 = {
					style = 'simple'
				},
				heading_4 = {
					style = 'simple'
				},
				heading_5 = {
					style = 'simple'
				},
				heading_6 = {
					style = 'simple'
				},
			},
			list_items = {
				enable = true,
				marker_minus = {
					add_padding = false,
					text = '•',
				},
				marker_plus = { add_padding = false },
				marker_star = { add_padding = false },
				marker_dot = { add_padding = false },
			},
		}
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			routes = {
				{
					view = "mini",
					filter = { event = "msg_showmode" }
				}
			},
			-- add any options here
			lsp = {
				signature = {
					enabled = false
				},
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
				}
			},
			presets = {
				-- bottom_search = true, -- use a classic bottom cmdline for search
				-- command_palette = true, -- position the cmdline and popupmenu together
				long_message_to_split = true, -- long messages will be sent to a split
				-- inc_rename = false, -- enables an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- add a border to hover docs and signature help
			},
			cmdline = {
				enabled = true,
				view = "cmdline",
				format = {
					cmdline = false,
					search_down = false,
					search_up = false,
					filter = false,
					lua = false,
					help = false,
					input = false
				}
			},
			messages = {
				enabled = true,
				view = "mini",
				view_search = false
			},
			popupmenu = {
				enabled = false
			},
			notify = {
				enabled = true,
				view = "mini"
			},
			hover = {
				silent = true
			},
			views = {
				mini = {
					position = {
						row = -2
					}
				},
			}
		},
		config = function(self)
			require('noice').setup(self.opts)
			vim.notify("noice.nvim loaded", "info", { title = "noice.nvim" })
		end,
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
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		version = "0.1.8"
	},
	{
		'stevearc/dressing.nvim',
		opts = {
			input = {
				relative = "editor"
			}
		}
	},
	{
		"nvim-telescope/telescope-file-browser.nvim",
		dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
	},
	{
		"rcarriga/nvim-notify",
		opts = {
			stages = "static"
		}

	}
}
