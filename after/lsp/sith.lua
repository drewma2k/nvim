local pwd = vim.loop.cwd()
vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.lsp.start({
			name = "SithLSP",
			filtypes = { "python" },
			root_dir = pwd,
			cmd = { "~/.local/bin/sith-lsp" },
			init_options = {
				settings = {
					ruff = {
						lint = {
							enable = true
						}
					}
				}
			}
		})
	end

})
