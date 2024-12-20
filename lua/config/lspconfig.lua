local ok, cmp = pcall(require, 'cmp_nvim_lsp')
if not ok then
	return
end

local ok, mason = pcall(require, 'mason')
if not ok then
	return
end

local ok, mason_lspconfig = pcall(require, 'mason-lspconfig')
if not ok then
	return
end

local ok, lspconfig = pcall(require, 'lspconfig')
if not ok then
	return
end

local ok, trouble = pcall(require, 'trouble')
if not ok then
	return
end

local map = vim.keymap.set

-- required for nvim-java
mason.setup()
-- require('java').setup({
-- 	spring_boot_tools = {
-- 		enable = false
-- 	},
-- 	jdk = {
-- 		auto_install = false
-- 	}
-- })

-- disable virtual text
vim.diagnostic.config({
	virtual_text = false,
})

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
map('n', '<space>d', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<space>ll', vim.diagnostic.setloclist, opts)
map('n', '<space>qq', vim.diagnostic.setqflist, opts)

-- LSP maps
local on_attach = function(client, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	map('n', 'gD', vim.lsp.buf.declaration, bufopts)
	map('n', 'gd', vim.lsp.buf.definition, bufopts)
	-- map('n', 'K', "<cmd>Lspsaga hover_doc<CR>", bufopts)
	map('n', 'K', vim.lsp.buf.hover, bufopts)
	map('n', 'gi', vim.lsp.buf.implementation, bufopts)
	-- covered by cmp
	-- map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	map('n', '<leader>wl', function()
		vim.inspect(vim.lsp.buf.list_workspace_folders())
	end, bufopts)
	map('n', '<leader>D', vim.lsp.buf.type_definition, { desc = "LSP Type Definition" })
	map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
	map('n', 'gr', vim.lsp.buf.references, bufopts)
	map('n', '<leader>cc', vim.lsp.buf.code_action, bufopts)
	map('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, bufopts)

	-- enable trouble maps if trouble is installed
	if trouble then
		map("n", "gr", "<cmd>Trouble lsp_references auto_refresh=false<cr>", bufopts)
		map("n", "gd", "<cmd>Trouble lsp_definitions<cr>", bufopts)
		map("n", "gi", "<cmd>Trouble lsp_implementations<cr>", bufopts)
		map("n", "q[", function()
			trouble.previous({ skip_groups = true, jump = true })
		end, bufopts)
		map("n", "q]", function()
			trouble.next({ skip_groups = true, jump = true })
		end, bufopts)
	end
	vim.api.nvim_create_user_command("Format", function() vim.lsp.buf.format { async = true } end, {})
	-- vim.lsp.buf.format { async = true }
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = 'rounded', -- none, single, double, rounded, solid, shadow
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
capabilities = vim.tbl_deep_extend(
	'force',
	capabilities,
	-- require('blink.cmp').get_lsp_capabilities()
	cmp.default_capabilities()
)
-- override individual language server options with a file that
-- returns the options table
local override_servers = {
	sumneko_lua = {
		settings = require('config.lsp.sumneko_lua')
	},
	gopls = {
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
			}
		}
	},
	cucumber_language_server = {
		cmd = { '/Users/yde639/bin/cucumber-language-server', '--stdio' }
	},
	sqlls = {
		cmd = { '/usr/local/bin/sql-language-server', 'up', '--method', 'stdio', '--debug' },
		-- root_dir = require('lspconfig.util').root_pattern '',
	},
	pylsp = {
		-- cmd = { '/Users/yde639/.venv/bin/pylsp' },
		settings = {
			pylsp = {
				plugins = {
					pycodestyle = {
						enabled = false
					},
					black = {
						enabled = true
					},
					pylint = {
						enabled = false
					},
					jedi_hover = {
						enabled = true
					}
				}
			}
		}
	},
	jdtls = {
		settings = {
			java = {
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
						-- globalSettings = '/Users/yde639/.m2/settings.xml'
					}
				}
			}
		},
	},

}

-- default options for all servers
local options = {
	on_attach = on_attach,
	capabilities = capabilities,
}

mason_lspconfig.setup({
	automatic_installation = true,
})

mason_lspconfig.setup_handlers {
	function(server_name)
		opts = vim.tbl_deep_extend("force", options, override_servers[server_name] or {})
		lspconfig[server_name].setup(opts)
	end,
}
