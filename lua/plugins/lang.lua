return {
	{
		'gaoDean/autolist.nvim',
		ft = "markdown",
		config = true,
		init = function(autolist)
			vim.keymap.set("n", "<leader>cn", function() autolist.cycle_next_dr() end, { expr = true })
			vim.keymap.set("n", "<leader>cp", function() autolist.cycle_prev_dr() end, { expr = true })
		end,
		keys = {
			{ mode="i", "<tab>",   "<cmd>AutolistTab<cr>" },
			{ mode="i", "<s-tab>", "<cmd>AutolistShiftTab<cr>" },
			{ mode="i", "<c-t>",   "<c-t><cmd>AutolistRecalculate<cr>" },
			{ mode="i", "<CR>",    "<CR><cmd>AutolistNewBullet<cr>" },
			{ mode="n", "o",       "o<cmd>AutolistNewBullet<cr>" },
			{ mode="n", "O",       "O<cmd>AutolistNewBulletBefore<cr>" },
			{ mode="n", "<CR>",    "<cmd>AutolistToggleCheckbox<cr><CR>" },
			{ mode="n", "<C-r>",   "<cmd>AutolistRecalculate<cr>" },
			{ mode="n", ">>",      ">><cmd>AutolistRecalculate<cr>" },
			{ mode="n", "<<",      "<<<cmd>AutolistRecalculate<cr>" },
			{ mode="n", "dd",      "dd<cmd>AutolistRecalculate<cr>", ft='markdown' },
			{ mode="v", "d",       "d<cmd>AutolistRecalculate<cr>" },
		}
	},
	{
		'nvim-java/nvim-java',
		priority = 10, -- higher than lspconfig
		opts = {
			notifications = {
				dap = false,
			},
			spring_boot_tools = {
				enable = false
			},
			jdk = {
				auto_install = false
			}
		}
	},
	-- {'sheerun/vim-polyglot'},
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
