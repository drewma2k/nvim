return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-python",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			-- "antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter"
		},
		config = function()
			require('neotest').setup({
				adapters = {
					require("neotest-python")
				},
				output = {
					enabled = true,
					open_on_run = true
				}
			})
		end
	},
}
