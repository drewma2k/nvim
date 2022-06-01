-- local runtime_path = vim.split(package.path, ';')

-- load modular configs
require('config.key-mapping')
require('plugin')
require('nvim_settings')


-- work settings
vim.opt.shell = '/bin/bash'

-- vim: ts=2 sts=2 sw=2 et
