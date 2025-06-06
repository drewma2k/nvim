local default_cmd = require('lspconfig.configs').jdtls.cmd or {}
return {
	root_dir = function() return vim.fs.root(0, '.git') end,
	cmd = default_cmd,
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
