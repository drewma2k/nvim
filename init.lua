-- local runtime_path = vim.split(package.path, ';')

-- fast loading
require('impatient')

-- load modular configs
require('nvim_settings')
require('config.key-mapping')
require('plugin')


-- work settings
vim.opt.shell = '/bin/zsh'
vim.opt.cursorline = true

-- vim: ts=2 sts=2 sw=2 et
