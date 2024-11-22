return {
	{ 'lewis6991/gitsigns.nvim' },
	{'tpope/vim-fugitive'},
	{
		'sindrets/diffview.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		config = function()
			local ok, diffview = pcall(require, "diffview")
			if not ok then
				return
			end
			diffview.setup({
				view = {
					default = {
						-- layout = -1
					}
				}
			})
		end
	},
}
