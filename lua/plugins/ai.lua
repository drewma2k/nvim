return {
	{
		-- "zbirenbaum/copilot.lua",
		-- using fork, because auto_trigger without input is broken
		"jsongerber/copilot.lua"
	},
	{
		'CopilotC-Nvim/CopilotChat.nvim',
		dependencies = {
			"jsongerber/copilot.lua",
			"nvim-lua/plenary.nvim"
		},
	},
}
