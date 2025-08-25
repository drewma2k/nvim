local get_cmd = function()
	if vim.fn.executable('lemminx-maven') == 1 then
		return {'lemminx-maven'}
	else
		return {'lemminx'}
	end
end
return {
	cmd = get_cmd()
}
