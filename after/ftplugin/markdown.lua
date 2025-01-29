vim.o.spell = false
vim.o.ts = 2
vim.o.sw = 2
vim.o.tw = 79
vim.o.conceallevel = 1

-- set foldmethod to marker for plugin
-- vim.o.foldmethod = 'expr'
-- vim.o.foldlevel = 99

-- enable folding by default
vim.o.foldenable = true
-- vim.g.markdown_folding = 1

-- enable autowriteall
vim.o.autowriteall = true

-- necessary because bullets.vim will not create the checkbox if it doesn't
-- exist
vim.keymap.set("n", "<C-c>", function()
	require('toggle-checkbox').toggle()
end
)

-- vim.keymap.set("i", "<tab>", "<Plug>(bullets-demote)")
-- vim.keymap.set("i", "<s-tab>", "<Plug>(bullets-promote)")

-- paste in visual mode creates link with system clipboard
vim.keymap.set("v", "gp", "c[<C-r>\"](\"<Esc>\"*pa\")<Esc>")

vim.opt.keywordprg = ":!dict -d wn "
