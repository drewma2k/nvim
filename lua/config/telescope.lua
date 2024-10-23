local ok, telescope = pcall(require, 'telescope')
if not ok then
	return
end

telescope.setup({
	extensions = {
      fuzzy = true,                    -- false will only do exact matching
      -- override_generic_sorter = true,  -- override the generic sorter
      -- override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",
	},
    defaults = {
        vimgrep_arguments = {
	    "rg",
	    "--color=never",
	    "--no-heading",
	    "--with-filename",
	    "--line-number",
	    "--column",
	    "--smart-case",
        }
    }
})
-- telescope.load_extension('fzf')
require("telescope").load_extension "file_browser"
