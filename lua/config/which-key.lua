local ok, whichkey = pcall(require, 'which-key')
if not ok then
	return
end
whichkey.setup {
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
