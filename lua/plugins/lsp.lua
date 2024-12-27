return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			"saghen/blink.cmp",
			'williamboman/mason-lspconfig',
			'williamboman/mason.nvim'
		},
		config = function()
			local mason_lspconfig = require('mason-lspconfig')
			local lspconfig = require('lspconfig')
			local _, trouble = pcall(require, 'trouble')
			local map = vim.keymap.set

			require('mason').setup()

			-- disable virtual text
			vim.diagnostic.config({
				virtual_text = false,
			})

			local opts = { noremap = true, silent = true }
			local on_attach = function(client, bufnr)
				local bufopts = { noremap = true, silent = true, buffer = bufnr }
				map('n', 'gD', vim.lsp.buf.declaration, bufopts)
				map('n', 'gd', vim.lsp.buf.definition, bufopts)
				map('n', 'K', vim.lsp.buf.hover, bufopts)
				map('n', 'gi', vim.lsp.buf.implementation, bufopts)
				map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
				map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
				map('n', '<leader>wl', function() vim.inspect(vim.lsp.buf.list_workspace_folders()) end, bufopts)
				map('n', '<leader>D', vim.lsp.buf.type_definition, { desc = "LSP Type Definition" })
				map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
				map('n', 'gr', vim.lsp.buf.references, bufopts)
				map('n', '<leader>cc', vim.lsp.buf.code_action, bufopts)
				map('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, bufopts)
				if trouble then
					map("n", "gr", "<cmd>Trouble lsp_references auto_refresh=false<cr>", bufopts)
					-- remove this because it makes the previous one slow
					map("n", "grr", "<Nop>", bufopts)
					map("n", "gd", "<cmd>Trouble lsp_definitions<cr>", bufopts)
					map("n", "gi", "<cmd>Trouble lsp_implementations<cr>", bufopts)
					map("n", "[q", function()
						trouble.previous({ skip_groups = true, jump = true })
					end, bufopts)
					map("n", "]q", function()
						trouble.next({ skip_groups = true, jump = true })
					end, bufopts)
				end
				vim.api.nvim_create_user_command("Format", function() vim.lsp.buf.format { async = true } end, {})
				vim.api.nvim_create_autocmd("CursorHold", {
					buffer = bufnr,
					callback = function()
						local opts = {
							focusable = false,
							close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
							source = 'always',
							prefix = ' ',
							scope = 'cursor',
						}
						vim.diagnostic.open_float(nil, opts)
					end
				})

				-- disable LSP highlighting, because it is worse than treesitter
				client.server_capabilities.semanticTokensProvider = nil
			end

			-- nvim-cmp supports additional completion capabilities
			local capabilities = lspconfig.util.default_config.capabilities

			-- ufo.nvim - tell server that client accepts folding ranges
			capabilities.textDocument.foldingRange = {
				dynamicRegistration = false,
				lineFoldingOnly = true
			}
			capabilities = require('blink.cmp').get_lsp_capabilities(capabilities)

			-- override individual language server options with a file that
			-- returns the options table
			local override_servers = {
				lua_ls = require('config.lsp.lua_ls'),
				gopls = require('config.lsp.gopls'),
				cucumber_language_server = {
					cmd = { '/Users/yde639/bin/cucumber-language-server', '--stdio' }
				},
				sqlls = {
					cmd = { '/usr/local/bin/sql-language-server', 'up', '--method', 'stdio', '--debug' },
				},
				pylsp = require('config.lsp.pylsp'),
				jdtls = require('config.lsp.jdtls'),
			}

			-- default options for all servers
			local options = { on_attach = on_attach, capabilities = capabilities }
			mason_lspconfig.setup({ automatic_installation = true })
			mason_lspconfig.setup_handlers {
				function(server_name)
					opts = vim.tbl_deep_extend("force", options, override_servers[server_name] or {})
					lspconfig[server_name].setup(opts)
				end,
			}
		end
	},
}
