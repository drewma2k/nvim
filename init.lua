-- load modular configsini
require('config.settings')
require("config.lazy")

vim.cmd[[set bg=dark]]
vim.cmd[[colorscheme onedark]]

require('config.key-mapping')


-- -- setup plugins
require('config.copilot')
require('config.which-key')
require('config.lualine')
require('config.lspconfig')
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
require('config.outline')
require('config.marks')
require('config.neotest')
require('config.markview')
require('config.ufo')
-- vim: ts=2 sts=2 sw=2 et
