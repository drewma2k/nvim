return {
	{'esmuellert/codediff.nvim'},
	{ 'lewis6991/gitsigns.nvim', config = true},
	{'tpope/vim-fugitive'},
	{
		'sindrets/diffview.nvim',
		dependencies = 'nvim-lua/plenary.nvim',
		enabled = false,
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
