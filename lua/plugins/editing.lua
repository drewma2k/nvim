return {
	{'dhruvasagar/vim-table-mode'},
	{'opdavies/toggle-checkbox.nvim'},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {
			disable_filetype = { "TelescopePrompt", "markdown" },
			enable_check_bracket_line = false,
		}
	},
}
