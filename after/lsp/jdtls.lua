-- Plain jdtls config (no nvim-java). Loaded by vim.lsp.enable('jdtls'),
-- which mason-lspconfig's automatic_enable handles after we re-include jdtls.
-- nvim-jdtls extensions (organize_imports, extract_method, test_class, ...)
-- still work — they only need the jdtls client to be running.

local mason_path = vim.fn.stdpath('data') .. '/mason/packages'
local jdtls_path = mason_path .. '/jdtls'
local java_debug_path = mason_path .. '/java-debug-adapter'
local java_test_path = mason_path .. '/java-test'
local lombok_jar = mason_path .. '/lombok-nightly/lombok.jar'

local uname = vim.uv.os_uname()
local os_config
if uname.sysname == 'Darwin' then
	os_config = uname.machine == 'arm64' and 'config_mac_arm' or 'config_mac'
elseif uname.sysname == 'Linux' then
	os_config = uname.machine:match('arm') and 'config_linux_arm' or 'config_linux'
else
	os_config = 'config_win'
end

local launcher_jar = vim.fn.glob(jdtls_path .. '/plugins/org.eclipse.equinox.launcher_*.jar')

-- Workspace dir is derived from cwd at config-load time. If you open files
-- from multiple Java projects in one nvim session and want separate
-- workspaces, restart nvim from each project root.
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local workspace_dir = vim.fn.stdpath('cache') .. '/jdtls-workspace/' .. project_name

local bundles = vim.split(
	vim.fn.glob(java_debug_path .. '/extension/server/com.microsoft.java.debug.plugin-*.jar', true),
	'\n',
	{ trimempty = true }
)
vim.list_extend(
	bundles,
	vim.split(vim.fn.glob(java_test_path .. '/extension/server/*.jar', true), '\n', { trimempty = true })
)

return {
	cmd = {
		'java',
		'-Declipse.application=org.eclipse.jdt.ls.core.id1',
		'-Dosgi.bundles.defaultStartLevel=4',
		'-Declipse.product=org.eclipse.jdt.ls.core.product',
		'-Dlog.protocol=true',
		'-Dlog.level=ALL',
		'-Xmx2g',
		'--add-modules=ALL-SYSTEM',
		'--add-opens', 'java.base/java.util=ALL-UNNAMED',
		'--add-opens', 'java.base/java.lang=ALL-UNNAMED',
		'-javaagent:' .. lombok_jar,
		'-jar', launcher_jar,
		'-configuration', jdtls_path .. '/' .. os_config,
		'-data', workspace_dir,
	},
	filetypes = { 'java' },
	root_markers = { 'gradlew', 'mvnw', 'pom.xml', 'build.gradle', 'build.gradle.kts', '.git' },
	init_options = {
		bundles = bundles,
		extendedClientCapabilities = {
			actionableRuntimeNotificationSupport = true,
			advancedExtractRefactoringSupport = true,
			advancedGenerateAccessorsSupport = true,
			advancedIntroduceParameterRefactoringSupport = true,
			advancedOrganizeImportsSupport = true,
			advancedUpgradeGradleSupport = true,
			classFileContentsSupport = true,
			clientDocumentSymbolProvider = true,
			clientHoverProvider = false,
			executeClientCommandSupport = true,
			extractInterfaceSupport = true,
			generateConstructorsPromptSupport = true,
			generateDelegateMethodsPromptSupport = true,
			generateToStringPromptSupport = true,
			gradleChecksumWrapperPromptSupport = true,
			hashCodeEqualsPromptSupport = true,
			inferSelectionSupport = {
				'extractConstant',
				'extractField',
				'extractInterface',
				'extractMethod',
				'extractVariableAllOccurrence',
				'extractVariable',
			},
			moveRefactoringSupport = true,
			overrideMethodsPromptSupport = true,
		},
	},
	settings = {
		java = {
			eclipse = { downloadSources = true },
			maven = { downloadSources = true },
			format = {
				enabled = true,
				settings = {
					url = "https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
					profile = "GoogleStyle",
				},
			},
			configuration = {
				runtimes = {
					{
						name = 'sdkman',
						path = vim.env.HOME .. '/.sdkman/candidates/java/current',
						default = true,
					},
				},
			},
			signatureHelp = { enabled = true },
			contentProvider = { preferred = 'fernflower' },
			completion = {
				favoriteStaticMembers = {
					'org.junit.jupiter.api.Assertions.*',
					'org.junit.Assert.*',
					'org.junit.Assume.*',
					'org.mockito.Mockito.*',
					'org.mockito.ArgumentMatchers.*',
				},
			},
			sources = {
				organizeImports = {
					starThreshold = 9999,
					staticStarThreshold = 9999,
				},
			},
		},
	},
	on_attach = function(_, bufnr)
		local jdtls = require('jdtls')
		-- nvim-jdtls's auto-register only runs from start_or_attach; under the
		-- lsp.config path we have to register the java dap adapter ourselves.
		-- Why: <leader>dd → dap.continue() needs `dap.adapters.java` set.
		require('jdtls.dap').setup_dap({ hotcodereplace = 'auto' })
		pcall(require('jdtls.dap').setup_dap_main_class_configs)

		local map = function(lhs, rhs, desc)
			vim.keymap.set('n', lhs, rhs, { buffer = bufnr, desc = desc })
		end
		map('<leader>tc', function() jdtls.test_class() end, 'Java: test class')
		map('<leader>tm', function() jdtls.test_nearest_method() end, 'Java: test nearest method')
		map('<leader>tp', function() require('jdtls.dap').pick_test() end, 'Java: pick test')
		map('<leader>oi', function() jdtls.organize_imports() end, 'Java: organize imports')
		map('<leader>ev', function() jdtls.extract_variable() end, 'Java: extract variable')
		map('<leader>ec', function() jdtls.extract_constant() end, 'Java: extract constant')
		vim.keymap.set('v', '<leader>em', function() jdtls.extract_method(true) end,
			{ buffer = bufnr, desc = 'Java: extract method' })
	end,
}
