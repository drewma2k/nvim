vim.g.mapleader = " "
local map = vim.keymap.set
local ok, dap = pcall(require, "dap")
if not ok then
	return
end

-- Normal --
-- DAP
map("n", "<leader>dd",
	function()
		dap.continue()
	end,
	{ desc = "start debugger" })
map("n", "<leader>db", "<cmd>lua require('dap').toggle_breakpoint()<cr>", { desc = "toggle breakpoint" })


-- Standard Operations
map("n", "<leader>m",
	function()
		local mouse = vim.opt.mouse:get()
		if mouse.n then
			vim.opt.mouse = ""
		else
			vim.opt.mouse = "nvi"
		end
	end,
	{ desc = "toggle mouse support" })
-- map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
-- map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "No Highlight" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<C-s>", "<cmd>w!<cr>", { desc = "Force write" })
map("n", "<C-q>", "<cmd>q!<cr>", { desc = "Force quit" })
map("n", "Q", "<Nop>")
map("n", "<leader>n", "<cmd>set norelativenumber!<cr>", { desc = "Toggle Relative Number " })

-- Packer
map("n", "<leader>pc", "<cmd>PackerCompile<cr>", { desc = "Packer Compile" })
map("n", "<leader>pi", "<cmd>PackerInstall<cr>", { desc = "Packer Install" })
map("n", "<leader>ps", "<cmd>PackerSync<cr>", { desc = "Packer Sync" })
map("n", "<leader>pS", "<cmd>PackerStatus<cr>", { desc = "Packer Status" })
map("n", "<leader>pu", "<cmd>PackerUpdate<cr>", { desc = "Packer Update" })

-- Tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle Explorer" })
-- map("n", "<leader>o", "<cmd>NvimTreeFocus<cr>", { desc = "Focus Explorer" })

-- Alpha
map("n", "<leader>a", "<cmd>Alpha<cr>", { desc = "Alpha Dashboard" })

-- map("n", "<leader>c", "<cmd>bdelete<cr>", { desc = "Close buffer" })

-- Comment
map("n", "<leader>/", "<Plug>(comment_toggle_linewise_current)", { desc = "Comment line" })
map(
	"v",
	"<leader>/",
	"<Plug>(comment_toggle_linewise_visual)",
	{ desc = "Toggle comment line" }
)

-- -- GitSigns
ok, gs = pcall(require, 'gitsigns')
if not ok then
	return
end
map("n", "<leader>gs", "<cmd>Gitsigns<cr>", {desc = "Gitsigns menu"})

-- LSP Installer
vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP information" })
vim.keymap.set("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", { desc = "LSP installer" })

-- Telescope
local ok, telescope = pcall(require, 'telescope.builtin')
if not ok then
	return
end
map("n", "<leader>fw", function()
	telescope.live_grep()
end, { desc = "Search words" })

map("n", "<leader>gt", function()
	telescope.git_status()
end, { desc = "Git status" })

map("n", "<leader>gb", function()
	telescope.git_branches()
end, { desc = "Git branchs" })

map("n", "<leader>gc", function()
	telescope.git_commits()
end, { desc = "Git commits" })

map("n", "<leader>ff", function()
	local opts = {no_ignore=true, hidden=false}
	telescope.find_files(opts)
end, { desc = "Search files" })

map("n", "<leader>fb", function()
	telescope.buffers()
end, { desc = "Search buffers" })

map("n", "<leader>fh", function()
	telescope.find_files({no_ignore=true, hidden=true})
end, { desc = "Find hidden files" })

map("n", "<leader>fm", function()
	telescope.marks()
end, { desc = "Search marks" })

map("n", "<leader>fo", function()
	telescope.oldfiles()
end, { desc = "Search history" })

map("n", "<leader>sm", function()
	telescope.man_pages()
end, { desc = "Search man" })

map("n", "<leader>sn", function()
	telescope.extensions.notify.notify()
end, { desc = "Search notifications" })

map("n", "<leader>sr", function()
	telescope.registers()
end, { desc = "Search registers" })

map("n", "<leader>sk", function()
	telescope.keymaps()
end, { desc = "Search keymaps" })

map("n", "<leader>sc", function()
	telescope.commands()
end, { desc = "Search commands" })

map("n", "<leader>ls", function()
	telescope.lsp_document_symbols()
end, { desc = "Search symbols" })

map("n", "<leader>lS", function()
	telescope.lsp_dynamic_workspace_symbols()
end, { desc = "Search all symbols" })

map("n", "<leader>lR", function()
	telescope.lsp_references()
end, { desc = "Search references" })

map("n", "<leader>lD", function()
	telescope.diagnostics()
end, { desc = "Search diagnostics" })

map("n", "<leader>scs", function()
	telescope.colorscheme()
end, { desc = "Search colorschemes" })


-- Stay in indent mode
map("v", "<", "<gv", { desc = "unindent line" })
map("v", ">", ">gv", { desc = "indent line" })

-- Improved Terminal Mappings
-- map("t", "<esc>", "<C-\\><C-n>", { desc = "Terminal normal mode" })
-- map("t", "jk", "<C-\\><C-n>", { desc = "Terminal normal mode" })
-- map("t", "<C-h>", "<c-\\><c-n><c-w>h", { desc = "Terminal left window navigation" })
-- map("t", "<C-j>", "<c-\\><c-n><c-w>j", { desc = "Terminal down window navigation" })
-- map("t", "<C-k>", "<c-\\><c-n><c-w>k", { desc = "Terminal up window navigation" })
-- map("t", "<C-l>", "<c-\\><c-n><c-w>l", { desc = "Terminal right window naviation" })

-- trouble.nvim
map("n", "<leader>xx", "<cmd>Trouble toggle<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xw", "<cmd>Trouble workspace_diagnostics toggle<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xd", "<cmd>Trouble document_diagnostics toggle<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<cr>",
  {silent = true, noremap = true}
)
map("n", "<leader>xq", "<cmd>Trouble quickfix toggle <cr>",
  {silent = true, noremap = true}
)

map("n", "<leader>xr", "<cmd>Trouble lsp_references toggle auto_refresh=false<cr>",
  {silent = true, noremap = true}
)
-- open file under cursor with system default
map("n", "gx", "<cmd>execute '!open ' . expand('<cfile>')<CR>")

-- toggle folds with tab
-- collides with <C-i> because of terminal jank but may be possible
map("n", "<Tab>", "za")

-- center after going to next search result
map("n", "n", "nzzzv")

-- DiffView
map("n", "<leader>dvo", "<cmd>DiffviewOpen main<cr>", { desc = "Open DiffView" })
map("n", "<leader>dvc", "<cmd>DiffviewClose<cr>", { desc = "Close DiffView" })
map("n", "<leader>dvh", "<cmd>DiffviewFileHistory %<cr>", { desc = "DiffView File History" })

