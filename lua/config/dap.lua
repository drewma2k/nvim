local ok, dap = pcall(require, 'dap')
if not ok then
	return
end

local ok, dap_go = pcall(require, 'dap-go')
if not ok then
	return
end

local ok, dapui = pcall(require, 'dapui')
if not ok then
	return
end

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

vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg='red' })
vim.fn.sign_define('DapBreakpoint', {text='', texthl='DapBreakpoint', linehl='', numhl=''})

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
    program = "${workspaceFolder}${env:MAINPATH}"
})
