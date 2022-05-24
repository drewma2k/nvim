-- local runtime_path = vim.split(package.path, ';')

-- load modular configs
require('nvim_settings')
require('config.key-mapping')
require('plugin')
require('config.plugin.lspconfig')
require('config.plugin.treesitter')
require('config.plugin.cmp')
require('config.plugin.nvim-tree')

-- vim: ts=2 sts=2 sw=2 et
