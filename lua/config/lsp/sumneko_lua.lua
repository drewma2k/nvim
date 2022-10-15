local runtime_path = vim.split(package.path, ';')
local settings = {
	Lua = {
		runtime = {
			-- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
			version = 'LuaJIT',
			-- Setup your lua path
			path = runtime_path,
		},
		diagnostics = {
			-- Get the language server to recognize the `vim` global
			globals = { 'vim' },
		},
		workspace = {
			-- Make the server aware of Neovim runtime files
			library = {
        [vim.fn.expand("$VIMRUNTIME/lua")] = true,
        [vim.fn.stdpath("config") .. "/lua"] = true,
      }
		},
		-- Do not send telemetry data containing a randomized but unique identifier
		telemetry = {
			enable = false,
		},
	},
}
return settings
-- vim: ts=2 sts=2 sw=2 et
