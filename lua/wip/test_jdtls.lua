local JdtlsClient = require('java-core.ls.clients.jdtls-client')
local async = require('java-core.utils.async').sync
local function get_error_handler(err)
	return vim.print
end

local function get_jdtls()
	local clients = vim.lsp.get_active_clients({ name = 'jdtls' })

	if #clients == 0 then
		get_error_handler('could not find an active jdtls client')()
	end

	return {
		client = clients[1],
	}
end


local test_request = function ()
	local jdtls = JdtlsClient(get_jdtls())
	vim.print(jdtls)
	local buf = vim.api.nvim_get_current_buf()
	return jdtls:request('workspace/executeCommand', {
		command = "java.maven.addDependency",
		arguments = "",
	}, buf)
	
end

local executeCommandHandler = vim.lsp.handlers['workspace/executeCommand']

local handler = function(err, result, ctx, config)
	if ctx.params.command == 'java.maven.addDependency' then
		-- Handle the response here
		if err then
			-- vim.print("Error:", err)
		else
			vim.print(result)
			vim.print(ctx)
			-- vim.print(result[2].documentChanges)
			vim.lsp.util.apply_workspace_edit(result[1], 'utf-8')
			vim.lsp.util.apply_workspace_edit(result[2], 'utf-8')
			vim.lsp.util.apply_workspace_edit(result[3], 'utf-8')
			-- vim.lsp.util.apply_text_document_edit(result[2].documentChanges, 'utf-8')
		end
	end
	executeCommandHandler(err, result, ctx, config)
end

-- overwrite the handler
vim.lsp.handlers['workspace/executeCommand'] = handler

vim.lsp.buf_request(
	10, -- bufnr (0 for current buffer)
	'workspace/executeCommand',
	{
		command = 'java.maven.addDependency',
		arguments = {
			"Class2",
			"com.fasterxml.jackson.core:jackson-databind:2.19.0",
			"file:///Users/drew/src/java/test-project/test-file/src/main/java/com/example/AnotherClass.java",
			0,
			0,
			12
		}
		-- argsments = vim.
	}
	-- vim.lsp.handlers['workspace/applyEdit']
)

