local ok, cmp = pcall(require, 'cmp_nvim_lsp')
if not ok then
	return
end

local ok, sqls = pcall(require, 'sqls')
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

-- disable virtual text
vim.diagnostic.config({
	virtual_text = false,
})

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>ll', vim.diagnostic.setloclist, opts)
vim.keymap.set('n', '<space>qq', vim.diagnostic.setqflist, opts)

-- LSP maps
local on_attach = function(_, bufnr)
	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	vim.keymap.set('n', '<leader>wl', function()
		vim.inspect(vim.lsp.buf.list_workspace_folders())
	end, bufopts)
	vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts, { desc = "LSP Type Definition" })
	vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
	vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, bufopts)
	vim.api.nvim_create_user_command("Format", function() vim.lsp.buf.format { async = true } end, {})
	-- vim.lsp.buf.format { async = true }
	vim.api.nvim_create_autocmd("CursorHold", {
		buffer = bufnr,
		callback = function()
			local opts = {
				focusable = false,
				close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
				border = 'none', -- none, single, double, rounded, solid, shadow
				source = 'always',
				prefix = ' ',
				scope = 'cursor',
			}
			vim.diagnostic.open_float(nil, opts)
		end
	})
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
	sqls = {
		on_attach = function(client, bufnr)
			sqls.on_attach(client, bufnr)
		end
	}
}

-- default options for all servers
local options = {
	on_attach = on_attach,
	capabilities = capabilities,
}

-- Setup Language servers
mason.setup({
	PATH = 'append'
})
mason_lspconfig.setup({
	automatic_installation = true,
})

mason_lspconfig.setup_handlers {
	function (server_name)
		opts = vim.tbl_deep_extend("force", options, override_servers[server_name] or {})
		lspconfig[server_name].setup(opts)
	end
}
