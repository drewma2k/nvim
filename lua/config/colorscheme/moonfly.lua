vim.g.moonflyNormalFloat = true

-- custom highlights
-- Lua initialization file
local custom_highlight = vim.api.nvim_create_augroup("CustomHighlight", {})
local colors = require("moonfly").palette
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "moonfly",
  callback = function()
	vim.cmd[[hi clear Folded]]
	vim.cmd[[hi link Folded Comment]]
  end,
  group = custom_highlight,
})

vim.cmd[[colorscheme moonfly]]
