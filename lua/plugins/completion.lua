return {
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp"
	},
	{
		'honza/vim-snippets'
	},
	{
		'saghen/blink.cmp',
		enabled = true,
		lazy = false, -- lazy loading handled internally
		dependencies = {
			'rafamadriz/friendly-snippets',
			'honza/vim-snippets',
			{ 'L3MON4D3/LuaSnip', version = 'v2.*' }
		},
		version = 'v1.*',
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
			snippets = { preset = 'luasnip' },
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
			},
			completion = {
				menu = {
					auto_show = function()
						if vim.g.blink_mode == "show" then
							return true
						end
						return false
					end
				}
			},
			appearance = {
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
			},
		},
		-- allows extending the providers array elsewhere in your config
		-- without having to redefine it
		opts_extend = { "sources.default" }
	},
}
