return {
	{
		"shortcuts/no-neck-pain.nvim",
		-- version = "*"
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			-- "rcarriga/nvim-notify",
		},
		config = function()
			require("noice").setup({
				cmdline = {
					enabled = false
				},
				messages = {
					enabled = false
				},
				popupmenu = {
					enabled = false
				},
				notify = {
					enabled = false
				},
				lsp = {
					progress = {
						enabled = false
					},
					signature = {
						enabled = false
					},
					-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
					override = {
						["vim.lsp.util.convert_input_to_markdown_lines"] = true,
						["vim.lsp.util.stylize_markdown"] = true,
						-- ["cmp.entry.get_documentation"] = false, -- requires hrsh7th/nvim-cmp
					},
				},
				-- you can enable a preset for easier configuration
				presets = {
					bottom_search = false, -- use a classic bottom cmdline for search
					command_palette = false, -- position the cmdline and popupmenu together
					long_message_to_split = false, -- long messages will be sent to a split
					inc_rename = false, -- enables an input dialog for inc-rename.nvim
					lsp_doc_border = false, -- add a border to hover docs and signature help
				},
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {}
	},
	{
		"ibhagwan/fzf-lua",
		-- optional for icon support
		dependencies = { "nvim-tree/nvim-web-devicons" },
		-- or if using mini.icons/mini.nvim
		-- dependencies = { "echasnovski/mini.icons" },
		opts = {}
	},
	{
		'stevearc/dressing.nvim',
		opts = {},
	},
	{
		"j-hui/fidget.nvim",
		opts = {
			-- options
			notification = {
				-- override_vim_notify = true
			}
		},
	},
	-- keymap popup
	{
		'folke/which-key.nvim',
		opts = {
			plugins = {
				spelling = { enabled = true },
				presets = { operators = false },
			},
			win = {
				border = "rounded",
				padding = { 2, 2, 2, 2 },
			},
			spec = {
				{ "<leader>c",  group = "copilot" },
				{ "<leader>dv", group = "diffview" },
				{ "<leader>d",  group = "debug" }
			}
		}
	},
	{
		'kyazdani42/nvim-tree.lua',
		dependencies = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		opts = {
			view = {
				width = {
					min = 30, -- needed
					max = -1
				},
			},
			renderer = {
				group_empty = true, -- needed
			},
		}
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
		},
		config = function()
			local ok, lualine = pcall(require, 'lualine')
			if not ok then
				return
			end
			local ok, custom_auto_theme = pcall(require, 'lualine.themes.auto')
			if not ok then
				return
			end

			-- customize auto theme
			for mode, components in pairs(custom_auto_theme) do
				for component, _ in pairs(components) do
					if mode == 'inactive' then
						custom_auto_theme[mode][component] = 'StatusLineNC'
					else
						custom_auto_theme[mode][component] = 'StatusLine'
					end
				end
				custom_auto_theme[mode].z = custom_auto_theme[mode].b
			end

			local mode = {
				function()
					return ""
				end,
				padding = { left = 0, right = 0 },
				cond = nil,
			}

			lualine.setup {
				options = {
					icons_enabled = true,
					theme = custom_auto_theme,
					component_separators = { left = '', right = '' },
					section_separators = { left = '', right = '' },
					disabled_filetypes = {
						-- 'NvimTree',
						'alpha',
					},
					always_divide_middle = true,
					globalstatus = false,
				},
				sections = {
					lualine_a = {
						mode,
					},
					lualine_b = {
						{
							'filename',
							path = 0,
						},
						'branch',
						{
							'diagnostics',
							colored = false,
							diagnostics_color = {
								-- Same values as the general color option can be used here.
								error = { bg = "lightgrey", fg = 'red', gui = 'bold' }, --'DiagnosticError', -- Changes diagnostics' error color.
								warn  = { bg = "lightgrey", fg = 'darkorange', gui = 'bold' }, --'DiagnosticWarn',  -- Changes diagnostics' warn color.
								info  = { bg = "lightgrey", fg = 'blue', gui = 'bold' }, --'DiagnosticInfo',  -- Changes diagnostics' info color.
								hint  = { bg = "", fg = '', gui = 'bold,reverse' }, --'DiagnosticHint',  -- Changes diagnostics' hint color.
							}
						},
					},
					lualine_c = {
					},
					lualine_x = {
						{
							'fileformat',
							symbols = {
								unix = "",
								dos = "",
								mac = "",
							},
						},
						{
							'filetype',
							colored = false,
							color = 'StatusLine'
						}
					},
					lualine_y = { 'progress' },
					lualine_z = { 'location' },
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = {
						{
							'filename',
							path = 1,
						},
					},
					lualine_x = { 'location' },
					lualine_y = {},
					lualine_z = {}
				},
				tabline = {},
				extensions = { 'nvim-tree', 'quickfix' }
			}
		end
	},
	-- dashboard
	{
		'goolord/alpha-nvim',
		enabled = true,
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
		"smjonas/live-command.nvim",
		main = "live-command",
		opts = {
			commands = {
				Norm = { cmd = 'norm' }
			},
		}
	},
	{
		"folke/trouble.nvim",
		enabled = true,
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			auto_refresh = false
		},
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xc",
				"<cmd>Trouble close<cr>",
				desc = "Close (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>cs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>cl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
		init = function()
			vim.api.nvim_create_autocmd("QuickFixCmdPost", {
				callback = function()
					vim.cmd([[Trouble qflist open]])
				end,
			})
		end
	},
	{
		'luukvbaal/statuscol.nvim',
		config = function()
			local ok, statuscol = pcall(require, 'statuscol')
			if not ok then
				return
			end
			local ok, builtin = pcall(require, 'statuscol.builtin')
			if not ok then
				return
			end


			statuscol.setup({
				ft_ignore = {
					'NvimTree', 'help', 'alpha', 'Trouble', 'mason', 'Outline'
				},
				segments = {
					-- {
					-- 	sign = {
					-- 		name = { 'Marks_*' },
					-- 		maxwidth = 1,
					-- 		colwidth = 1,
					-- 		auto = false
					-- 	},
					-- 	click = 'v:lua.ScSa'
					-- },
					-- { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
					{
						CLICK = "v:lua.ScSa",
						sign = {
							name = { ".*" },
							condition = { true, builtin.not_empty },
							click = "v:lua.ScLa",
						}
					},
					{
						sign = {
							-- name = { 'GitSigns' },
							namespace = { 'gitsign' },
							maxwidth = 1,
							colwidth = 1,
							auto = false,
						},
						click = 'v:lua.ScSa'
					},
					{
						text = { builtin.lnumfunc, " " },
						condition = { true, builtin.not_empty },
						click = "v:lua.ScLa",
					},
				},
			})
		end
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = 'ibl',
		opts = {
			scope = {
				enabled = false
			}
		}
	},
	{
		'stevearc/aerial.nvim',
		opts = {
			layout = {
				max_width = nil,
				min_width = 0.25,
				placement = 'edge',
				resize_to_content = true
			}
		},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
		keys = {
			{ "<leader>o", "<cmd>AerialToggle!<cr>", desc = "Toggle Outline" }
		},

	},
	{
		"OXY2DEV/markview.nvim",
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons"
		},
		lazy = false,
		priority = 49,
		opts = {
			preview = {
				enable = true
			},
			-- hybrid_modes = { 'n' },
			markdown = {
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
			},
		}
	},
	{
		'nvim-treesitter/nvim-treesitter',
		-- version = "v0.9.0",
		build = ":TSUpdate",
		lazy = false,
		dependencies = {
			"OXY2DEV/markview.nvim"
		},
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				-- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "python" },
				sync_install = false,
				highlight = { enable = true },
				indent = {
					enable = true,
					disable = { 'markdown' }
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						node_incremental = "v",
						node_decremental = "V"
					}
				}
			})
		end
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		-- version = "0.1.8",
		opts = {
			extensions = {
				fzf = {
					fuzzy = true,    -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case",
				}
			},
			defaults = {
				mappings = {
					i = {
						["<C-q>"] = "smart_send_to_qflist"
					}
				},
				file_ignore_patterns = {
					"node_modules"
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				}
			}
		}
	},
}
