-- Diagnostic messages as Lua tables
local diagnostics = {
  {
    severity = vim.diagnostic.severity.INFO,
    message = "Consider adding LuaDoc or comment annotations for the `qftf` function to improve maintainability and provide parameter descriptions.",
    lnum = 3, -- line_number - 1 (0-based index)
	col = 0,
  },
  {
    severity = vim.diagnostic.severity.WARN,
    message = "Direct use of the global `_G` table can lead to naming collisions; consider using a local module table or `vim.api.nvim_create_namespace` for safer scoping.",
    lnum = 3,
	col = 0,
  },
  {
    severity = vim.diagnostic.severity.INFO,
    message = "The commented-out code block for changing quickfix directory could be removed or moved to documentation to reduce clutter.",
    lnum = 8,
	col = 0,
  },
  {
    severity = vim.diagnostic.severity.HINT,
    message = "The magic number `31` assigned to `limit` could be extracted into a named constant for better readability and easier future adjustments.",
    lnum = 20,
	col = 0,
  },
  {
    severity = vim.diagnostic.severity.WARN,
    message = "The expression `fname:sub(1 - limit)` may not behave as intended for short file names; verify the substring logic to avoid truncation issues.",
    lnum = 33,
	col = 0,
  },
  {
    severity = vim.diagnostic.severity.INFO,
    message = "Consider using `vim.fn.strdisplaywidth` instead of `#fname` for length checks to correctly handle multibyte or wide characters in file names.",
    lnum = 29,
	col = 0,
  },
  {
    severity = vim.diagnostic.severity.HINT,
    message = "Repeated string format patterns (`fnameFmt1`, `fnameFmt2`, `validFmt`) could be moved to a configuration section or constants to improve clarity.",
    lnum = 21,
	col = 0,
  },
  {
    severity = vim.diagnostic.severity.INFO,
    message = "Using `table.insert` in a performance-critical loop may be slightly slower; assigning directly to `ret[#ret+1]` can be more efficient.",
    lnum = 43,
	col = 0,
  },
}

-- Publish diagnostics for the current buffer
local namespace = vim.api.nvim_create_namespace("code_analysis")
vim.diagnostic.set(namespace, 0, diagnostics, {})

