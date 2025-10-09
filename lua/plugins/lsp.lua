return {
	{
		"antosha417/nvim-lsp-file-operations",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-tree.lua",
		},
		config = function ()
			require("lsp-file-operations").setup()
		end
	},
	{
		'neovim/nvim-lspconfig',
		version = "v2.4.0", --lspconfig.jdtls.setup is required for nvim-java, but deprecated after this version
		dependencies = {
			"saghen/blink.cmp",
			'mason-org/mason-lspconfig.nvim',
			{'mason-org/mason.nvim',
			opts = {
				registries = {
					"github:mason-org/mason-registry",
					"file:" .. vim.fn.stdpath('config') .. '/mason'
				}
			}},
			'folke/trouble.nvim',
			'nvim-java/nvim-java',
		},
		lazy = false,
		config = function()
			local trouble = require('trouble')
			require('java').setup({})

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

			require('mason-lspconfig').setup({
				automatic_installation = true,
				automatic_enable = true
			})

			-- Must setup jdtls with lspconfig because nvim-java
			-- wraps jdtls.setup(). Change when nvim-java supports
			-- vim.lsp.config
			local opts = require('config.lsp.jdtls')
			opts.capabilities = require('blink.cmp').get_lsp_capabilities()
			-- add filetree capabilities
			opts.capabilities = vim.tbl_deep_extend("force", opts.capabilities, require('lsp-file-operations').default_capabilities())
			require('lspconfig').jdtls.setup(opts)

			-- expend default capabilities
			vim.lsp.config('*', { capabilities = opts.capabilities })
		end,
	},
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python",
			{
				"nvim-telescope/telescope.nvim",
				-- branch = "0.1.x",
				dependencies = { "nvim-lua/plenary.nvim" }
			}
		},
		lazy = false,
		branch = "main",
		opts = {},
		keys = {
			{ ",v", "<cmd>VenvSelect<cr>" }
		}
	},
}
