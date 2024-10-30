-- local ok, null_ls = pcall(require, 'null-ls')
-- if not ok then
-- 	return
-- end

-- local ok, dict = pcall(require, 'config.dictionary')
-- if not ok then
-- 	return
-- end

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

-- local border = {
--   { " ", "NormalFloat" },
--   { " ", "NormalFloat" },
--   { " ", "NormalFloat" },
--   { " ", "NormalFloat" },
--   { " ", "NormalFloat" },
--   { " ", "NormalFloat" },
--   { " ", "NormalFloat" },
--   { " ", "NormalFloat" },
-- }
--
--
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--   opts = opts or {}
--   opts.border = opts.border or border
--   return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover, {
    -- Use a sharp border with `FloatBorder` highlights
    border = "rounded"
  }
)

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
	map('n', 'K', vim.lsp.buf.hover, bufopts)
	map('n', 'gi', vim.lsp.buf.implementation, bufopts)
	-- covered by cmp
	-- map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	map('n', '<leader>wl', function()
		vim.inspect(vim.lsp.buf.list_workspace_folders())
	end, bufopts)
	map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts, { desc = "LSP Type Definition" })
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
	client.server_capabilities.semanticTokensProvider = nil
end

-- nvim-cmp supports additional completion capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = vim.tbl_deep_extend(
	'force',
	capabilities,
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
	-- pylsp = {
	-- 	cmd = { '/opt/homebrew/bin/pylsp'},
	-- 	settings = {
	-- 		pylsp = {
	-- 			plugins = {
	-- 				pycodestyle = {
	-- 					enabled = false
	-- 				},
	-- 				black = {
	-- 					enabled = true
	-- 				},
	-- 				pylint = {
	-- 					enabled = true
	-- 				}
	-- 			}
	-- 		}
	-- 	}
	-- },
	-- jdtls = {
	-- 	cmd = {
 --    'java',
 --    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
 --    '-Dosgi.bundles.defaultStartLevel=4',
 --    '-Declipse.product=org.eclipse.jdt.ls.core.product',
 --    '-Dlog.protocol=true',
 --    '-Dlog.level=ALL',
 --    '-Xmx1g',
 --    '-javaagent:/Users/yde639/.config/nvim/dependencies/lombok-edge.jar',
 --    '-jar', '/opt/homebrew/Cellar/jdtls/1.38.0/libexec/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar',
 --    '-configuration', '/opt/homebrew/Cellar/jdtls/1.38.0/libexec/config_mac_arm',
 --    '-data', '/Users/yde639/workspace/' .. project_name
	--   }
	-- }
}


-- default options for all servers
local options = {
	on_attach = on_attach,
	capabilities = capabilities,
}

-- Setup Language servers
mason.setup({
	PATH = 'append',
	providers = {
		"mason.providers.registry-api",
		"mason.providers.client",
	},
	registries = {
	'github:mason-org/mason-registry',
	},
	log_level = vim.log.levels.DEBUG,
})


mason_lspconfig.setup({
	automatic_installation = true,
})

mason_lspconfig.setup_handlers {
	function(server_name)
		opts = vim.tbl_deep_extend("force", options, override_servers[server_name] or {})
		lspconfig[server_name].setup(opts)
	end,
}



-- null_ls.setup({
-- 	sources = { dict },
-- 	on_attach = on_attach
-- })
