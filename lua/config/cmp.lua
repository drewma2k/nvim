local ok, cmp = pcall(require, 'cmp')
if not ok then
	return
end

local ok, luasnip = pcall(require, 'luasnip')
if not ok then
	return
end

local ok, lspkind = pcall(require, 'lspkind')
if not ok then
	return
end

local ok, cmp_autopairs = pcall(require, 'nvim-autopairs.completion.cmp')
if not ok then
	return
end

-- for moonfly colorscheme
local winhighlight = {
  winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
}


cmp.setup({
	performance = {
		debounce = 0,
		throttle = 0,
		-- fetching_timeout = 80
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text', -- show only symbol annotations
			menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[Latex]",
				cmp_nvim_r = "[R]",
				copilot = "[Copilot]"
			}),
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)

			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			before = function(entry, vim_item)
				return vim_item
			end
		})
	},
	preselect = cmp.PreselectMode.None,
	snippet = {
		-- REQUIRED - you must specify a snippet engine
		expand = function(args)
			luasnip.lsp_expand(args.body) -- For `luasnip` users.
			-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(winhighlight),
    documentation = cmp.config.window.bordered(winhighlight),
		-- completion = cmp.config.window.bordered(),
		-- documentation = cmp.config.window.bordered(),
	},
	mapping = {
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		-- ["<C-n>"] = cmp.mapping.select_next_item(),
		-- ["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-h>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(1) then
				luasnip.jump(1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		["<C-n>"] = cmp.mapping(function(fallback)
			if luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<Tab>'] = cmp.mapping(function(fallback)
			local col = vim.fn.col('.') - 1

			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.jumpable() then
				luasnip.jump(1)
			-- don't autocomplete if the cursor is at the end of the line or if the character before the cursor is a space
			elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
				fallback()
			else
				cmp.complete()
			end
		end, { 'i', 's' }),

		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'copilot' },
		{ name = 'vim-dadbod-completion' },
		-- { name = 'ultisnips' }, -- For ultisnips users.
		{ name = 'path' },
		{ name = 'nvim_lsp_signature_help' }
	}, {
		{ name = 'buffer' },
	})
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- special config for R files
cmp.setup.filetype('R', {
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'path' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'cmp_nvim_r' }
	}, {
		{ name = 'buffer' },
	})
})

-- nvim api for lua files
cmp.setup.filetype('lua', {
	sources = cmp.config.sources({
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' }, -- For luasnip users.
		{ name = 'path' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'nvim_lua' }
	}, {
		{ name = 'buffer' },
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' }
	}
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

cmp.event:on(
	'confirm_done',
	cmp_autopairs.on_confirm_done()
)
-- create command for disabling autocomplete
vim.api.nvim_create_user_command("CmpDisable", function() require('cmp').setup.buffer { enabled = false } end, {})
vim.api.nvim_create_user_command("CmpEnable", function() require('cmp').setup.buffer { enabled = true } end, {})
