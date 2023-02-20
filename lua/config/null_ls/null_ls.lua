local ok, null_ls = pcall(require, 'null-ls')
if not ok then
	return
end

local ok, lspconfig = pcall(require, 'config.lspconfig')
if not ok then
	return
end

local ok, dict = pcall(require, 'config.null_ls.dictionary')
if not ok then
	return
end

null_ls.setup({
	sources = { dict },
	on_attach = lspconfig.on_attach
})
