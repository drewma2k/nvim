local ok, lightbulb = pcall(require, 'nvim-lightbulb')
if not ok then
	return
end

lightbulb.setup({
    -- LSP client names to ignore
    -- Example: {"sumneko_lua", "null-ls"}
    ignore = {},
    sign = {
        enabled = true,
        -- Priority of the gutter sign
        priority = 10,
		text = "",
    },
        autocmd = {
        enabled = true,
        -- see :help autocmd-pattern
        pattern = {"*"},
        -- see :help autocmd-events
        events = {"CursorHold", "CursorHoldI"}
    }
})
vim.fn.sign_define('LightBulbSign', { text = "", texthl = "", linehl="", numhl="" })
