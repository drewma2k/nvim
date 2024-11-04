local ok, alpha = pcall(require, 'alpha')
if not ok then
	return
end
local ok, dashboard = pcall(require, 'alpha.themes.dashboard')
if not ok then
	return 
end

dashboard.section.header.val = require('ascii').art.planets.planets.saturn

alpha.setup(dashboard.opts)
