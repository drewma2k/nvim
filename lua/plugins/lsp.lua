return {
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			"saghen/blink.cmp",
			-- version 1.* required until nvim-java supports Mason v2
			{ 'mason-org/mason-lspconfig.nvim', version = "^1.0.0" },
			{ 'mason-org/mason.nvim',           version = "^1.0.0" },
			'folke/trouble.nvim',
			'nvim-java/nvim-java'
		},
		lazy = false,
		config = function()
			local mason_lspconfig = require('mason-lspconfig')
			local trouble = require('trouble')

			require('mason').setup({
				registries = {
					'file:' .. vim.fn.stdpath('config') .. '/mason',
					'github:nvim-java/mason-registry',
					'github:mason-org/mason-registry',

				}
			})

			vim.api.nvim_create_autocmd('LspAttach', {
				callback = function(event)
					local map = function(mode, keys, func, desc)
						mode = mode or 'n'
						desc = desc or ''
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
					end
					map('n', 'gD', vim.lsp.buf.declaration)
					map('n', 'gi', vim.lsp.buf.implementation)
					map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
					map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)
					map('n', '<leader>wl', function() vim.inspect(vim.lsp.buf.list_workspace_folders()) end)
					map('n', '<leader>D', vim.lsp.buf.type_definition, "LSP Type Definition")
					map('n', '<leader>rn', vim.lsp.buf.rename)
					map('n', 'gr', vim.lsp.buf.references)
					map('n', '<leader>cc', vim.lsp.buf.code_action)
					map('n', '<leader>so', require('telescope.builtin').lsp_document_symbols)
					if trouble then
						map("n", "gr", "<cmd>Trouble lsp_references auto_refresh=false<cr>")
						-- remove this because it makes the previous one slow
						map("n", "grr", "<Nop>")
						-- map("n", "gd", "<cmd>Trouble lsp_definitions<cr>")
						map("n", "gi", "<cmd>Trouble lsp_implementations<cr>")
						map("n", "[q", function()
							trouble.prev({ skip_groups = true, jump = true })
						end)
						map("n", "]q", function()
							trouble.next({ skip_groups = true, jump = true })
						end)
					end
					vim.api.nvim_create_user_command("Format", function() vim.lsp.buf.format { async = true } end, {})
					vim.api.nvim_create_autocmd("CursorHold", {
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
				end
			})

			mason_lspconfig.setup({ automatic_installation = true })
			mason_lspconfig.setup_handlers {
				function(server_name)
					vim.lsp.config(server_name, {})
					vim.lsp.enable(server_name)
				end,
				["jdtls"] = function ()
					-- jdtls must be setup with lspconfig until it is update to
					-- support vim.lsp.config
					local capabilities = require('blink.cmp').get_lsp_capabilities()
					require('java').setup({
						jdk = {
							auto_install = false
						}
					})
					local opts = require('config.lsp.jdtls')
					opts.capabilities = capabilities
					require('lspconfig').jdtls.setup(opts)

				end
			}
		end,
	},
}
