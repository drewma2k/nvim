return {
	-- keymap popup
	{
		'folke/which-key.nvim',
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
			plugins = {
				spelling = { enabled = true },
				presets = { operators = false },
				-- registers = false,
			},
			win = {
				border = "rounded",
				padding = { 2, 2, 2, 2 },
			},
		}
	},
	{
		'kyazdani42/nvim-tree.lua',
		dependencies = {
			'kyazdani42/nvim-web-devicons', -- optional, for file icon
		},
		opts = {
			-- BEGIN_DEFAULT_OPTS
			on_attach = "default",
			hijack_cursor = false,
			auto_reload_on_write = true,
			disable_netrw = false,
			hijack_netrw = true,
			hijack_unnamed_buffer_when_opening = false,
			root_dirs = {},
			prefer_startup_root = false,
			sync_root_with_cwd = false,
			reload_on_bufenter = false,
			respect_buf_cwd = false,
			select_prompts = false,
			sort = {
				sorter = "name",
				folders_first = true,
				files_first = false,
			},
			view = {
				centralize_selection = false,
				cursorline = true,
				debounce_delay = 15,
				side = "left",
				preserve_window_proportions = false,
				number = false,
				relativenumber = false,
				signcolumn = "yes",
				width = {
					min = 30,
					max = -1
				},
				float = {
					enable = false,
					quit_on_focus_loss = true,
					open_win_config = {
						relative = "editor",
						border = "rounded",
						width = 30,
						height = 30,
						row = 1,
						col = 1,
					},
				},
			},
			renderer = {
				add_trailing = false,
				group_empty = true,
				full_name = false,
				root_folder_label = ":~:s?$?/..?",
				indent_width = 2,
				special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
				symlink_destination = true,
				highlight_git = "none",
				highlight_diagnostics = "none",
				highlight_opened_files = "none",
				highlight_modified = "none",
				highlight_bookmarks = "none",
				highlight_clipboard = "name",
				indent_markers = {
					enable = false,
					inline_arrows = true,
					icons = {
						corner = "└",
						edge = "│",
						item = "│",
						bottom = "─",
						none = " ",
					},
				},
				icons = {
					web_devicons = {
						file = {
							enable = true,
							color = true,
						},
						folder = {
							enable = false,
							color = true,
						},
					},
					git_placement = "before",
					modified_placement = "after",
					diagnostics_placement = "signcolumn",
					bookmarks_placement = "signcolumn",
					padding = " ",
					symlink_arrow = " ➛ ",
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
						modified = true,
						diagnostics = true,
						bookmarks = true,
					},
					glyphs = {
						default = "",
						symlink = "",
						bookmark = "󰆤",
						modified = "●",
						folder = {
							arrow_closed = "",
							arrow_open = "",
							default = "",
							open = "",
							empty = "",
							empty_open = "",
							symlink = "",
							symlink_open = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
			update_focused_file = {
				enable = false,
				update_root = {
					enable = false,
					ignore_list = {},
				},
				exclude = false,
			},
			system_open = {
				cmd = "",
				args = {},
			},
			git = {
				enable = true,
				show_on_dirs = true,
				show_on_open_dirs = true,
				disable_for_dirs = {},
				timeout = 400,
				cygwin_support = false,
			},
			diagnostics = {
				enable = false,
				show_on_dirs = false,
				show_on_open_dirs = true,
				debounce_delay = 50,
				severity = {
					min = vim.diagnostic.severity.HINT,
					max = vim.diagnostic.severity.ERROR,
				},
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			modified = {
				enable = false,
				show_on_dirs = true,
				show_on_open_dirs = true,
			},
			filters = {
				enable = true,
				git_ignored = true,
				dotfiles = false,
				git_clean = false,
				no_buffer = false,
				no_bookmark = false,
				custom = {},
				exclude = {},
			},
			live_filter = {
				prefix = "[FILTER]: ",
				always_show_folders = true,
			},
			filesystem_watchers = {
				enable = true,
				debounce_delay = 50,
				ignore_dirs = {},
			},
			actions = {
				use_system_clipboard = true,
				change_dir = {
					enable = true,
					global = false,
					restrict_above_cwd = false,
				},
				expand_all = {
					max_folder_discovery = 300,
					exclude = {},
				},
				file_popup = {
					open_win_config = {
						col = 1,
						row = 1,
						relative = "cursor",
						border = "shadow",
						style = "minimal",
					},
				},
				open_file = {
					quit_on_open = false,
					eject = true,
					resize_window = true,
					window_picker = {
						enable = true,
						picker = "default",
						chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
						exclude = {
							filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
							buftype = { "nofile", "terminal", "help" },
						},
					},
				},
				remove_file = {
					close_window = true,
				},
			},
			trash = {
				cmd = "gio trash",
			},
			tab = {
				sync = {
					open = false,
					close = false,
					ignore = {},
				},
			},
			notify = {
				threshold = vim.log.levels.INFO,
				absolute_path = true,
			},
			help = {
				sort_by = "key",
			},
			ui = {
				confirm = {
					remove = true,
					trash = true,
					default_yes = false,
				},
			},
			experimental = {},
			log = {
				enable = false,
				truncate = false,
				types = {
					all = false,
					config = false,
					copy_paste = false,
					dev = false,
					diagnostics = false,
					git = false,
					profile = false,
					watcher = false,
				},
			},
		}
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
		config = true,
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
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
		"hedyhli/outline.nvim",
		keys = {
			{ "<leader>o", "<cmd>Outline<CR>", desc = "toggle Outline" }
		},
		opts = {
			symbols = {
				filter = {
					-- default = { 'String', exclude = true },
					python = { 'Function' },
				}
			}
		}
	},
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
		'nvim-treesitter/nvim-treesitter',
		-- version = "v0.9.0",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				-- ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "python" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		version = "0.1.8",
		opts = {
			extensions = {
				fuzzy = true, -- false will only do exact matching
				-- override_generic_sorter = true,  -- override the generic sorter
				-- override_file_sorter = true,     -- override the file sorter
				case_mode = "smart_case",
			},
			defaults = {
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
