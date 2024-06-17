local ok, cmp = pcall(require, 'cmp_nvim_lsp')
if not ok then
	return
end

local ok, trouble = pcall(require, 'trouble')
if not ok then
	return
end

-- setup useful directories
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
local root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'})

local map = vim.keymap.set
-- See `:help vim.lsp.start_client` for an overview of the suppor-- If you started neovim within `~/dev/xy/project-1` this would resolve to `project-1`
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
		map("n", "gr", "<cmd>Trouble lsp_references<cr>", bufopts)
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

----------------------
-- JDTLS configuration
----------------------
local config = {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {
    'java',
    '-Declipse.application=org.eclipse.jdt.ls.core.id1',
    '-Dosgi.bundles.defaultStartLevel=4',
    '-Declipse.product=org.eclipse.jdt.ls.core.product',
    '-Dlog.protocol=true',
    '-Dlog.level=ALL',
    '-Xmx1g',
    '-javaagent:/Users/yde639/.config/nvim/dependencies/lombok-edge.jar',
    '-jar', '/opt/homebrew/Cellar/jdtls/1.36.0/libexec/plugins/org.eclipse.equinox.launcher_1.6.800.v20240513-1750.jar',
    '-configuration', '/opt/homebrew/Cellar/jdtls/1.36.0/libexec/config_mac_arm',
    '-data', '/Users/yde639/workspace/'
  },

  -- 💀
  -- This is the default if not provided, you can remove it. Or adjust as needed.
  -- One dedicated LSP server & client will be started per unique root_dir
  root_dir = root_dir,

  -- Here you can configure eclipse.jdt.ls specific settings
  -- See https://github.com/eclipse/eclipse.jdt.ls/wiki/Running-the-JAVA-LS-server-from-the-command-line#initialize-request
  -- for a list of options
  settings = {
    java = {
      configuration = {
        maven = {
          -- globalSettings = '/Users/yde639/.m2/settings.xml'
        }
      }
    }
  },

  -- Language server `initializationOptions`
  -- You need to extend the `bundles` with paths to jar files
  -- if you want to use additional eclipse.jdt.ls plugins.
  --
  -- See https://github.com/mfussenegger/nvim-jdtls#java-debug-installation
  --
  -- If you don't plan on using the debugger or other eclipse.jdt.ls plugins you can remove this
  init_options = {
    bundles = {}
  },
}
-- This starts a new client & server,
-- or attaches to an existing client & server depending on the `root_dir`.
require('jdtls').start_or_attach(config)
