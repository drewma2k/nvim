return {
	{
		-- "zbirenbaum/copilot.lua",
		-- using fork, because auto_trigger without input is broken
		"zbirenbaum/copilot.lua"
	},
	{
		'CopilotC-Nvim/CopilotChat.nvim',
		branch = 'main',
		version = '3.2.0',
		dependencies = {
			"zbirenbaum/copilot.lua",
			"nvim-lua/plenary.nvim"
		},
	},
}
