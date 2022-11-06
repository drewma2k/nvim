local ok, luasnip = pcall(require, 'luasnip.loaders.from_snipmate')
if not ok then
	return
end

luasnip.lazy_load()
