local ok, alpha = pcall(require, 'alpha')
if not ok then
	return
end
local ok, dashboard = pcall(require, 'alpha.themes.dashboard')
if not ok then
	return 
end

-- menu

alpha.setup(dashboard.opts)
