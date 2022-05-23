vim.g.mapleader = " "
local map = vim.keymap.set

map("", "<Space>", "<Nop>") -- disable space because leader

-- Normal --
-- Standard Operations
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
map("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
map("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "No Highlight" })
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<C-s>", "<cmd>w!<cr>", { desc = "Force write" })
map("n", "<C-q>", "<cmd>q!<cr>", { desc = "Force quit" })
map("n", "Q", "<Nop>")

-- Packer
map("n", "<leader>pc", "<cmd>PackerCompile<cr>", { desc = "Packer Compile" })
map("n", "<leader>pi", "<cmd>PackerInstall<cr>", { desc = "Packer Install" })
map("n", "<leader>ps", "<cmd>PackerSync<cr>", { desc = "Packer Sync" })
map("n", "<leader>pS", "<cmd>PackerStatus<cr>", { desc = "Packer Status" })
map("n", "<leader>pu", "<cmd>PackerUpdate<cr>", { desc = "Packer Update" })

-- Alpha
  map("n", "<leader>d", "<cmd>Alpha<cr>", { desc = "Alpha Dashboard" })

  map("n", "<leader>c", "<cmd>bdelete<cr>", { desc = "Close buffer" })

-- Comment
  map("n", "<leader>/", function()
    require("Comment.api").toggle_current_linewise()
  end, { desc = "Comment line" })
  map(
    "v",
    "<leader>/",
    "<esc><cmd>lua require('Comment.api').toggle_linewise_op(vim.fn.visualmode())<cr>",
    { desc = "Toggle comment line" }
  )

-- -- GitSigns
-- if is_available "gitsigns.nvim" then
--   map("n", "<leader>gj", function()
--     require("gitsigns").next_hunk()
--   end, { desc = "Next git hunk" })
--   map("n", "<leader>gk", function()
--     require("gitsigns").prev_hunk()
--   end, { desc = "Previous git hunk" })
--   map("n", "<leader>gl", function()
--     require("gitsigns").blame_line()
--   end, { desc = "View git blame" })
--   map("n", "<leader>gp", function()
--     require("gitsigns").preview_hunk()
--   end, { desc = "Preview git hunk" })
--   map("n", "<leader>gh", function()
--     require("gitsigns").reset_hunk()
--   end, { desc = "Reset git hunk" })
--   map("n", "<leader>gr", function()
--     require("gitsigns").reset_buffer()
--   end, { desc = "Reset git buffer" })
--   map("n", "<leader>gs", function()
--     require("gitsigns").stage_hunk()
--   end, { desc = "Stage git hunk" })
--   map("n", "<leader>gu", function()
--     require("gitsigns").undo_stage_hunk()
--   end, { desc = "Unstage git hunk" })
--   map("n", "<leader>gd", function()
--     require("gitsigns").diffthis()
--   end, { desc = "View git diff" })
-- end



-- LSP Installer
  vim.keymap.set("n", "<leader>li", "<cmd>LspInfo<cr>", { desc = "LSP information" })
  vim.keymap.set("n", "<leader>lI", "<cmd>LspInstallInfo<cr>", { desc = "LSP installer" })

-- SymbolsOutline
  -- map("n", "<leader>lS", "<cmd>AerialToggle<cr>", { desc = "Symbols outline" })

-- Telescope
  map("n", "<leader>fw", function()
    require("telescope.builtin").live_grep()
  end, { desc = "Search words" })
  map("n", "<leader>gt", function()
    require("telescope.builtin").git_status()
  end, { desc = "Git status" })
  map("n", "<leader>gb", function()
    require("telescope.builtin").git_branches()
  end, { desc = "Git branchs" })
  map("n", "<leader>gc", function()
    require("telescope.builtin").git_commits()
  end, { desc = "Git commits" })
  map("n", "<leader>ff", function()
    require("telescope.builtin").find_files()
  end, { desc = "Search files" })
  map("n", "<leader>fb", function()
    require("telescope.builtin").buffers()
  end, { desc = "Search buffers" })
  map("n", "<leader>fh", function()
    require("telescope.builtin").help_tags()
  end, { desc = "Search help" })
  map("n", "<leader>fm", function()
    require("telescope.builtin").marks()
  end, { desc = "Search marks" })
  map("n", "<leader>fo", function()
    require("telescope.builtin").oldfiles()
  end, { desc = "Search history" })
  map("n", "<leader>sb", function()
    require("telescope.builtin").git_branches()
  end, { desc = "Git branchs" })
  map("n", "<leader>sh", function()
    require("telescope.builtin").help_tags()
  end, { desc = "Search help" })
  map("n", "<leader>sm", function()
    require("telescope.builtin").man_pages()
  end, { desc = "Search man" })
  map("n", "<leader>sn", function()
    require("telescope").extensions.notify.notify()
  end, { desc = "Search notifications" })
  map("n", "<leader>sr", function()
    require("telescope.builtin").registers()
  end, { desc = "Search registers" })
  map("n", "<leader>sk", function()
    require("telescope.builtin").keymaps()
  end, { desc = "Search keymaps" })
  map("n", "<leader>sc", function()
    require("telescope.builtin").commands()
  end, { desc = "Search commands" })
  map("n", "<leader>ls", function()
    local aerial_avail, _ = pcall(require, "aerial")
    if aerial_avail then
      require("telescope").extensions.aerial.aerial()
    else
      require("telescope.builtin").lsp_document_symbols()
    end
  end, { desc = "Search symbols" })
  map("n", "<leader>lR", function()
    require("telescope.builtin").lsp_references()
  end, { desc = "Search references" })
  map("n", "<leader>lD", function()
    require("telescope.builtin").diagnostics()
  end, { desc = "Search diagnostics" })

-- Terminal
-- if is_available "nvim-toggleterm.lua" then
--   local toggle_term_cmd = astronvim.toggle_term_cmd
--   map("n", "<C-\\>", "<cmd>ToggleTerm<cr>", { desc = "Toggle terminal" })
--   map("n", "<leader>gg", function()
--     toggle_term_cmd "lazygit"
--   end, { desc = "ToggleTerm lazygit" })
--   map("n", "<leader>tn", function()
--     toggle_term_cmd "node"
--   end, { desc = "ToggleTerm node" })
--   map("n", "<leader>tu", function()
--     toggle_term_cmd "ncdu"
--   end, { desc = "ToggleTerm NCDU" })
--   map("n", "<leader>tt", function()
--     toggle_term_cmd "htop"
--   end, { desc = "ToggleTerm htop" })
--   map("n", "<leader>tp", function()
--     toggle_term_cmd "python"
--   end, { desc = "ToggleTerm python" })
--   map("n", "<leader>tl", function()
--     toggle_term_cmd "lazygit"
--   end, { desc = "ToggleTerm lazygit" })
--   map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
--   map("n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "ToggleTerm horizontal split" })
--   map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "ToggleTerm vertical split" })
-- end

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
