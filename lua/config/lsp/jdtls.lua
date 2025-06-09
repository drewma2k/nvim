return {
	root_dir = function() return vim.fs.root(0, '.git') end,
	init_options = {
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
			-- This option causes issues with blink.cmp, because the
			-- implemented function does not return a value. Must override the
			-- whole table because nvim-java does not deep-extend this config.
			-- nvim-java issue: https://github.com/nvim-java/nvim-java/issues/396
			-- blink.cmp issue: https://github.com/Saghen/blink.cmp/issues/1864
			-- onCompletionItemSelectedCommand = 'editor.action.triggerParameterHints',
			overrideMethodsPromptSupport = true,
		},
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
				maven = {
					globalSettings = '/Users/yde639/.m2/settings.xml',
					userSettings = '/Users/yde639/.m2/settings.xml'
				}
			}
		}
	},
}
