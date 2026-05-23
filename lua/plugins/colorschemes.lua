return {
	{"ellisonleao/gruvbox.nvim"},
	{'rebelot/kanagawa.nvim'},
	{'EdenEast/nightfox.nvim'},
	{'bluz71/vim-moonfly-colors'},
	{'folke/tokyonight.nvim'},
	{"catppuccin/nvim", name = "catppuccin"},
	{
		'navarasu/onedark.nvim',
		config = function ()
			require('onedark').setup({
				style = 'dark'
			})
		end
	},
	{
		'kepano/flexoki-neovim',
		name = 'flexoki',
		priority = 1000,
		config = function ()
			vim.cmd.colorscheme('flexoki')

			-- fix highlights for DAPIU
			vim.cmd[[hi clear WinBar]]
			vim.cmd[[hi clear WinBarNC]]
			vim.cmd[[hi link WinBar StatusLine]]
			vim.cmd[[hi link WinBarNC StatusLineNC]]
		end
	},
	{'zenbones-theme/zenbones.nvim', dependencies = "rktjmp/lush.nvim"},
}
