return {
	-- overwrites options from nvim-java. No way to merge yet.
	-- Either have to copy config from nvim-java or don't edit init_options
	-- init_options = {
	-- 	bundles = { vim.env.HOME .. "/.local/share/nvim/mason/packages/share/jdtls/plugins/com.microsoft.java.maven.jar"},
	-- },
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
