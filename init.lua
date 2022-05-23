-- local runtime_path = vim.split(package.path, ';')

-- load modular configs
require('config.key-mapping')
require('plugin')
require('config.plugin.lspconfig')
require('config.plugin.treesitter')
require('config.plugin.cmp')
require('config.plugin.nvim-tree')
require('nvim_settings')

-- vim: ts=2 sts=2 sw=2 et
