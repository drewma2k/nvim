return {
	{'dhruvasagar/vim-table-mode'},
	{'opdavies/toggle-checkbox.nvim'},
	{'numToStr/Comment.nvim'},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {
			disable_filetype = { "TelescopePrompt", "markdown" },
		}
	},
}
