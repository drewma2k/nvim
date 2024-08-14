-- Apply custom highlights on colorscheme change.
-- Must be declared before executing ':colorscheme'.
-- turns off italics
grpid = vim.api.nvim_create_augroup('custom_highlights', {})
vim.api.nvim_create_autocmd('ColorScheme', {
  group = grpid,
  pattern = '*bones',
  command = 'hi Comment  gui=NONE |' ..
            'hi Constant gui=NONE'
})

vim.cmd[[colorscheme zenburned]]
vim.cmd[[hi link NvimTreeGitDirty Error]]
