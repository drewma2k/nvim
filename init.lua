-- load modular configsini
require("config.lazy")
require('config.settings')
require('config.key-mapping')


-- -- setup plugins
require('config.dap')
require('config.outline')
require('config.marks')
require('config.neotest')
require('config.ufo')


-- run the fortune command and generate a fortune as a string
local fortune = vim.fn.system("fortune")
-- require("noice").notify(fortune, "warn", { title = "Fortune" })

-- vim: ts=2 sts=2 sw=2 et
