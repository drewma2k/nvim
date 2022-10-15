-- local border = {
--   { "╭", "NormalFloat" },
--   { "─", "NormalFloat" },
--   { "╮", "NormalFloat" },
--   { "│", "NormalFloat" },
--   { "╯", "NormalFloat" },
--   { "─", "NormalFloat" },
--   { "╰", "NormalFloat" },
--   { "│", "NormalFloat" },
-- }
--
--
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
--   opts = opts or {}
--   opts.border = opts.border or border
--   return orig_util_open_floating_preview(contents, syntax, opts, ...)
-- end

-- LSP maps
local on_attach = function(_, bufnr)
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
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
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>so', require('telescope.builtin').lsp_document_symbols, bufopts)
  vim.api.nvim_create_user_command("Format", vim.lsp.buf.formatting, {})
  vim.api.nvim_create_autocmd("CursorHold", {
  buffer = bufnr,
  callback = function()
    local opts = {
      focusable = false,
      close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
      border = 'none',
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
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

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
		  require('sqls').on_attach(client, bufnr)
	  end
  }
}

-- default options for all servers
local options = {
  on_attach = on_attach,
  capabilities = capabilities,
}

-- Setup Language servers
local lsp_installer = require('nvim-lsp-installer')
local servers = lsp_installer.get_installed_servers()

-- setup each installed server
for _, lsp in pairs(servers) do
  -- override with custom config
  local opts = vim.tbl_deep_extend("force", options, override_servers[lsp.name] or {})
  require('lspconfig')[lsp.name].setup(opts)
end
