vim.g.mapleader = " "
local map = vim.keymap.set
local ok, dap = pcall(require, "dap")
if not ok then
	return
end

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
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "No Highlight" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<C-s>", "<cmd>w!<cr>", { desc = "Force write" })
map("n", "<C-q>", "<cmd>q!<cr>", { desc = "Force quit" })
map("n", "Q", "<Nop>")
map("n", "<leader>n", "<cmd>set norelativenumber!<cr>", { desc = "Toggle Relative Number " })

-- Tree
map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle Explorer" })

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

-- toggle folds with tab
map("n", "<Tab>", "za")
map("n", "<C-i>", "<C-i>")

-- center after going to next search result, and open folds
map("n", "n", "nzzzv")

-- DiffView
map("n", "<leader>dvo", "<cmd>DiffviewOpen main<cr>", { desc = "Open DiffView" })
map("n", "<leader>dvc", "<cmd>DiffviewClose<cr>", { desc = "Close DiffView" })
map("n", "<leader>dvh", "<cmd>DiffviewFileHistory %<cr>", { desc = "DiffView File History" })


-- telecope context menu
local pickers = require "telescope.pickers"
local finders = require "telescope.finders"
local conf = require("telescope.config").values
local actions = require "telescope.actions"
local action_state = require "telescope.actions.state"


-- prototype custom menu
local colors = function()
  opts = require("telescope.themes").get_dropdown{}
  pickers.new(opts, {
    prompt_title = "colors",
    finder = finders.new_table {
      results = { "red", "green", "blue" }
    },
    sorter = conf.generic_sorter(opts),
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        print(vim.inspect(selection))
        vim.api.nvim_put({ selection[1] }, "", false, true)
      end)
      return true
    end,
  }):find()
end
map("n", "<leader><leader>", colors)

-- gf creates files if they don't exist
map("n", "gf", "<cmd>e <cfile><cr>")
