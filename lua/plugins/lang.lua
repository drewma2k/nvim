return {
	{
		'bullets-vim/bullets.vim',
		lazy = false,
		init = function()
			-- disable default mappings
			vim.g.bullets_set_mappings = 0
		end,
		keys = {
			{ '<cr>',   '<Plug>(bullets-newline)',  mode = 'i' },
			{ '<C-cr>', '<cr>',                     mode = 'i' }, -- remap false?
			{ 'o',      '<Plug>(bullets-newline)',  mode = 'n' },
			{ 'gN',     '<Plug>(bullets-renumber)', mode = 'v' },
			{ 'gN',     '<Plug>(bullets-renumber)', mode = 'n' },
			{ '<C-t>',  '<Plug>(bullets-demote)',   mode = 'i' },
			{ '>>',     '<Plug>(bullets-demote)',   mode = 'n' },
			{ '>',      '<Plug>(bullets-demote)',   mode = 'v' },
			{ '<C-d>',  '<Plug>(bullets-promote)',  mode = 'i' },
			{ '<<',     '<Plug>(bullets-promote)',  mode = 'n' },
			{ '<',      '<Plug>(bullets-promote)',  mode = 'v' },
		}
	},
	{
		'nvim-java/nvim-java',
		config = false, -- for some reason, setup here does not work
		-- opts = {
		-- 	notifications = {
		-- 		dap = false,
		-- 	},
		-- 	spring_boot_tools = {
		-- 		enable = false
		-- 	},
		-- 	jdk = {
		-- 		auto_install = false
		-- 	}
		-- }
	},
	{ 'martinda/Jenkinsfile-vim-syntax' },
	{
		"eatgrass/maven.nvim",
		cmd = { "Maven", "MavenExec" },
		dependencies = "nvim-lua/plenary.nvim",
		config = function()
			require('maven').setup({
				executable = "mvn",
				commands = {
					{ cmd = { "install", "-Dmaven.test.skip" }, desc = "Install without tests" }
				}
			})
		end
	},
	-- Bogiefiles
	{
		"https://github.cloud.capitalone.com/forecast/vim",
		optional = true
	},
	-- sql helper
	{ 'tpope/vim-dadbod' },
	{ 'kristijanhusak/vim-dadbod-ui' },
	{ 'kristijanhusak/vim-dadbod-completion' },
}
