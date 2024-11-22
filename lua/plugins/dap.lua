return {
	{'mfussenegger/nvim-dap', dependencies = "nvim-neotest/nvim-nio"},
	{'rcarriga/nvim-dap-ui'},
	{'leoluz/nvim-dap-go'},
	{
		"mfussenegger/nvim-dap-python",
		config = function()
			require('dap-python').setup()
			require('dap-python').test_runner = 'pytest'
			table.insert(require('dap').configurations.python, {
				type = 'python',
				request = 'launch',
				name = "Run Test",
				program = function()
					return require('dap-python').test_method
				end,
			})
		end
	},
}
