return {
	{
		"nvim-neotest/neotest",
		dependencies = {
			"nvim-neotest/neotest-python",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"nvim-treesitter/nvim-treesitter"
		},
		event = 'BufRead *.py',
		keys = {
			-- { "n", "<leader>tr", "<cmd>Neotest run<CR>", desc = "Run tests" },
			-- { "n", "<leader>td",
			-- 	function()
			-- 		require("neotest").run.run({ strategy = "dap" })
			-- 	end,
			-- 	desc = "Run test"
			-- }
		},
		config = function()
			require('neotest').setup({
				adapters = {
					require("neotest-python")
				},
				output = {
					enabled = true,
					open_on_run = true
				},
				quickfix = {
					open = false,
					enabled = false
				}
			})
		end
	},
}
