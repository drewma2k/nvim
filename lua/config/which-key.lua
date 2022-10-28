require("which-key").setup {
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
	plugins = {
		spelling = { enabled = true },
		presets = { operators = false },
	},
	window = {
		border = "rounded",
		padding = { 2, 2, 2, 2 },
	},
}
