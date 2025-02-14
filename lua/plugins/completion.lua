return {
	{
		'hrsh7th/nvim-cmp',
		enabled = false,
		dependencies = {
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'hrsh7th/cmp-cmdline' },
			{ 'hrsh7th/cmp-nvim-lua' },
			{ 'onsails/lspkind.nvim' },
			{ 'saadparwaiz1/cmp_luasnip' },
		},
	},
	{
		'L3MON4D3/LuaSnip',
		build = "make install_jsregexp",
		config = function()
			require('luasnip.loaders.from_vscode').lazy_load()
			require('luasnip.loaders.from_snipmate').lazy_load()
		end
	},
	{
		'honza/vim-snippets'
	},
	{
		'saghen/blink.cmp',
		enabled = true,
		lazy = false, -- lazy loading handled internally
		-- event = 'InsertEnter',
		-- optional: provides snippets for the snippet source
		dependencies = { 'rafamadriz/friendly-snippets',
			{ 'L3MON4D3/LuaSnip', version = 'v2.*' } },
		-- use a release tag to download pre-built binaries
		version = 'v0.*',
		-- OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
		-- build = 'cargo build --release',
		-- If you use nix, you can build from source using latest nightly rust with:
		-- build = 'nix run .#build-plugin',

		init = function()
			-- toggle autoshow
			vim.g.blink_mode = "noshow"
			vim.keymap.set("n", "<leader>bs", function()
				if vim.g.blink_mode == "show" then
					vim.g.blink_mode = "noshow"
				else
					vim.g.blink_mode = "show"
				end
			end, { desc = "Toggle Autocompletion" })
		end,
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			-- 'default' for mappings similar to built-in completion
			-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
			-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
			-- see the "default configuration" section below for full documentation on how to define
			-- your own keymap.
			keymap = {
				preset = 'default',
				['<Tab>'] = {
					'select_next',
					'snippet_forward',
					'fallback'
				},
				['<S-Tab>'] = {
					'select_prev',
					'snippet_backward',
					'fallback'
				},
				['<CR>'] = { 'accept', 'fallback' },
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
				cmdline = {
					preset = 'enter',
					['<Tab>'] = {
						'show',
						'select_next',
						'snippet_forward',
						'fallback'
					},
					['<S-Tab>'] = {
						'select_prev',
						'snippet_backward',
						'fallback'
					},
					['<CR>'] = { 'fallback' },
					["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
					cmdline = {

					}
				}
			},
			completion = {
				-- list = {
				-- 	selection = function(ctx)
				-- 		return ctx.mode == 'cmdline' and 'auto_insert' or 'preselect'
				-- 	end
				-- },
				menu = {
					auto_show = function()
						if vim.g.blink_mode == "show" then
							return true
						end
						return false
					end
					-- 	draw = {
					-- 		columns = {
					-- 			{ "label", "label_description", gap = 1 },
					-- 			{"kind_icon", "kind", gap=1},
					-- 			{"source_name"}
					-- 		},
					-- 	}
				}
			},
			appearance = {
				-- Sets the fallback highlight groups to nvim-cmp's highlight groups
				-- Useful for when your theme doesn't support blink.cmp
				-- will be removed in a future release
				use_nvim_cmp_as_default = true,
				-- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = 'mono'
			},
			-- default list of enabled providers defined so that you can extend it
			-- elsewhere in your config, without redefining it, via `opts_extend`
			sources = {
				default = { 'lsp', 'path', 'snippets', 'buffer' },
				per_filetype = {
					codecompanion = { "codecompanion" },
				},
				-- optionally disable cmdline completions
				cmdline = {},
			},
			-- experimental signature help support
			signature = { enabled = true },
			snippets = {
				preset = 'luasnip'
			}
		},
		-- allows extending the providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" }
	},
}
