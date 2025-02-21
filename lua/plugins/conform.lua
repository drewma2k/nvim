return {
	'stevearc/conform.nvim',
	config = function()
		require("conform").setup({
			-- log_level = vim.log.levels.DEBUG,
			formatters_by_ft = {
				lua = { "stylelua" },
				python = { "isort", "black" },
			},
		})
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end
}
