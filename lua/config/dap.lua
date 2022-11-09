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
