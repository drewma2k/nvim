return {
	root_dir = function() return vim.fs.root(0, '.git') end,
	filetypes = {"java"},
	init_options = {
		bundles = {"/Users/drew/.local/share/nvim/mason/packages/jdtls/plugins/com.microsoft.java.maven.plugin-0.39.0.jar"},
	},
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
				runtimes = {
					name = "sdkman",
					path = vim.env.HOME .. '/.sdkman/candidates/java/current',
					default = true
				}
			}
		}
	},
}
