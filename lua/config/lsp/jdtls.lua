local function get_config()
	local default_cmd = require('lspconfig.configs').jdtls.cmd or {}
	table.insert(default_cmd, '-Dhttp.proxyHost=http://entproxy.kdc.capitalone.com')
	table.insert(default_cmd, '-Dhttp.proxyHost=http://entproxy.kdc.capitalone.com')
end
return {
	root_dir = function() return vim.fs.root(0, '.git') end,
	cmd = get_config(),
	settings = {
		java = {
			eclipse = {
				downloadSources = true
			},
			maven = {
				downloadSources = true,
			},
			format = {
				enabled = true,
				settings = {
					url =
					"https://raw.githubusercontent.com/google/styleguide/gh-pages/eclipse-java-google-style.xml",
					profile = "GoogleStyle"
				}
			},
			configuration = {
				maven = {
					globalSettings = '/Users/yde639/.m2/settings.xml',
					userSettings = '/Users/yde639/.m2/settings.xml'
				}
			}
		}
	},
}
