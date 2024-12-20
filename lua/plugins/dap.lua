return {
	{
		'mfussenegger/nvim-dap',
		dependencies = { "nvim-neotest/nvim-nio", "rcarriga/nvim-dap-ui", "mfussenegger/nvim-dap-python" },
		config = function()
			local ok, dap = pcall(require, 'dap')
			if not ok then
				return
			end

			local ok, dap_go = pcall(require, 'dap-go')
			if not ok then
				return
			end

			local dapui = require('dapui')

			dapui.setup()
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			dap_go.setup()

			vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = 'red' })
			vim.fn.sign_define('DapBreakpoint', { text = '', texthl = 'DapBreakpoint', linehl = '', numhl = '' })

			-- go configuration
			table.insert(dap.configurations.go, {
				type = "go",
				name = "Debug cmd/server",
				request = "launch",
				program = "${workspaceFolder}/cmd/server"
			})

			table.insert(dap.configurations.go, {
				type = "go",
				name = "Debug $MAINPATH",
				request = "launch",
				program = function()
					local co = coroutine.running()
					local cb = function(input)
						coroutine.resume(co, input)
					end
					cb = vim.schedule_wrap(cb)
					vim.ui.input({ "Enter path to main.go: ", kind = 'dap' }, cb)
					local path = coroutine.yield()
					return "${workspaceFolder}/" .. path
				end
				-- program = function ()
				-- 	return "${workspaceFolder}"..vim.fn.input("Enter path to main.go: ")
				-- end;
				-- program = "${workspaceFolder}${MAINPATH}"
			})

			--  attach remote
			table.insert(dap.configurations.go, {
				type = "go",
				name = "Attach remote",
				mode = "local",
				request = "attach",
				processId = require('dap.utils').pick_process,
			})
		end
	},
	{ 'rcarriga/nvim-dap-ui' },
	{ 'leoluz/nvim-dap-go' },
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
