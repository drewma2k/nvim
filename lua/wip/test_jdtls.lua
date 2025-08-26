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


local test_request = function()
	local jdtls = JdtlsClient(get_jdtls())
	vim.print(jdtls)
	local buf = vim.api.nvim_get_current_buf()
	return jdtls:request('workspace/executeCommand', {
		command = "java.maven.addDependency",
		arguments = "",
	}, buf)
end

local request = function()
	vim.lsp.buf_request(
		5, -- bufnr (0 for current buffer)
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
end

-- NOTE: possible commands:
-- "java.maven.initializeSearcher"
-- "java.maven.searchArtifact"

local initialize_searcher = function ()
	vim.lsp.buf_request(
		0,
		'workspace/executeCommand',
		{
			command = 'java.maven.initializeSearcher',
			arguments = {
				vim.env.MASON .. '/packages/maven/extension/resources/IndexData/'
			}
		},
		function (err, result, context, config)
			vim.print('initialize')
			vim.print(err)
			vim.print(result)
		end

	)
end
-- initialize_searcher()

local search_artifact = function ()
	vim.lsp.buf_request(
		0,
		'workspace/executeCommand',
		{
			command = 'java.maven.searchArtifact',
			arguments = {
				{
					["searchType"] = "CLASSNAME",
					["className"] = "ObjectMapper"

					-- searchType = "IDENTIFIER",
					-- groupId = ""
					-- artifactId = ""
				}
			}
		},
		function (err, result, context, config)
			vim.print("search")
			vim.print(err)
			vim.print(result)
		end

	)
end

local control_context = function ()
	vim.lsp.buf_request(
		0,
		'workspace/executeCommand',
		{
			command = 'java.maven.controlContext',
			arguments = {
				true
			}
		},
		function (err, result, context, config)
			vim.print("context")
			vim.print(err)
			vim.print(result)
		end

	)
end

-- search_artifact()

return {
	search_artifact = search_artifact,
	initialize_searcher = initialize_searcher,
	control_context = control_context
}
