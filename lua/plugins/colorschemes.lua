return {
	{"ellisonleao/gruvbox.nvim"},
	{'rebelot/kanagawa.nvim'},
	{'EdenEast/nightfox.nvim'},
	{'bluz71/vim-moonfly-colors'},
	{'folke/tokyonight.nvim'},
	{"catppuccin/nvim", name = "catppuccin"},
	{
		'navarasu/onedark.nvim',
		priority = 1000,
		config = function ()
			require('onedark').setup({
				style = 'warmer'
			})
			require('onedark').load()
		end
	},
	{'zenbones-theme/zenbones.nvim', dependencies = "rktjmp/lush.nvim"},
}
