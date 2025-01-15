return {
	{'bullets-vim/bullets.vim'},
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
