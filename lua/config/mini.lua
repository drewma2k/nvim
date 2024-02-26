local ok, splitjoin = pcall(require, 'mini.splitjoin')
if not ok then
	return
end

local ok, files = pcall(require, 'mini.files')
if not ok then
	return
end

splitjoin.setup()
files.setup()
