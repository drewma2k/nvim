vim.o.spell = true
vim.o.ts = 2
vim.o.sw = 2
vim.o.tw = 79
vim.o.conceallevel = 1

-- set foldmethod to marker for plugin
vim.o.foldmethod = 'expr'
vim.o.foldlevel = 99

-- enable folding by default
vim.o.foldenable = true
vim.g.markdown_folding = 1

-- enable autowriteall
vim.o.autowriteall = true

vim.keymap.set("n", "<C-c>", function()
	require('toggle-checkbox').toggle()
end
)

-- vim.keymap.set("i", "<TAB>", "<Plug>(bullets-demote)")
-- vim.keymap.set("i", "<S-TAB>", "<Plug>(bullets-promote)")
-- vim.g.bullets_outline_levels = {}
