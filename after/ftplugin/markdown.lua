vim.o.ts = 2
vim.o.sw = 2
vim.o.tw = 79
vim.o.conceallevel = 1

vim.o.autowriteall = true

-- necessary because bullets.vim will not create the checkbox if it doesn't
-- exist
vim.keymap.set("n", "<C-c>", function()
	require('toggle-checkbox').toggle()
end
)

-- paste in visual mode creates link with system clipboard
vim.keymap.set("v", "gp", "c[<C-r>\"](\"<Esc>\"*pa\")<Esc>")

vim.opt.keywordprg = ":!dict -d wn "
