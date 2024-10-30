-- load modular configs
-- require('config.colorscheme.zenburned')
-- vim.cmd[[colorscheme onedark]]
vim.cmd[[set bg=dark]]
vim.cmd[[colorscheme onedark]]
require('config.key-mapping')
require('config.plugins')
require('config.settings')


-- setup plugins
require('config.copilot')
require('config.impatient')
require('config.which-key')
require('config.alpha_config')
require('config.lualine')
require('config.lspconfig')
require('config.treesitter')
require('config.cmp')
require('config.nvim-tree')
require('config.autopairs')
require('config.luasnip')
require('config.comment')
require('config.livecommand')
require('config.key-mapping')
require('config.dressing')
require('config.lightbulb')
require('config.dap')
require('config.telescope')
require('config.gitsigns')
require('config.trouble')
require('config.nvim-r')
require('config.mini')
require('config.statuscol')
require('config.indentblankline')
require('config.menu')
require('config.outline')
require('config.marks')
require('config.neotest')
require('config.markview')
-- vim: ts=2 sts=2 sw=2 et
