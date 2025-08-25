-- need two user commands to cover all functionality:
-- resolve unknown dependency
-- TODO: cleanup
-- TODO: fix class at cursor position
-- TODO: fix import to fully qualified name
-- TODO: only add dependency if it isn't already in the pom
-- TODO: integrate dependency search to implement the above



local select = vim.ui.select

-- Replaces vim.ui.select to capture codeaction selections and
-- inject a custom code action for java files. The custom code action
-- triggers the java.maven.addDependency command, which is understood by the vscode-maven
-- jdlts extension.
---@diagnostic disable-next-line: duplicate-set-field
vim.ui.select = function(actions, select_opts, on_user_choice)
	if select_opts.kind ~= "codeaction" then
		select(actions, select_opts, on_user_choice)
		return
	end

	local client_id = actions[1].ctx.client_id
	local lnum = vim.fn.line(".")
	local col = vim.fn.col(".")
	local word_under_cursor = vim.fn.expand("<cword>")
	local full_path = vim.fn.expand('%:p')
	local uri = 'file://' .. full_path
	local item = {
		ctx = {
			method = "workspace/executeCommand",
			client_id = client_id,
			bufnr = 0
		},
		action = {
			title = "Add Dependency",
			command = "java.maven.addDependency",
			arguments = {
				word_under_cursor,
				"com.fasterxml.jackson.core:jackson-databind:2.19.0",
				uri,
				lnum - 1,
				col,
				col + #word_under_cursor
			}
		}
	}
	local diagnostics = vim.diagnostic.get(0, { lnum = vim.api.nvim_win_get_cursor(0)[1] - 1 })
	for i, diagnostic in ipairs(diagnostics) do
		if string.find(diagnostic.message, "cannot be resolved to a type") then
			table.insert(actions, item)
		end
	end
	select(actions, select_opts, on_user_choice)
end


vim.api.nvim_create_user_command("JavaAddDependency", function(name, args, fargs)
	-- TODO
end, {})

local executeCommandHandler = vim.lsp.handlers['workspace/executeCommand']

-- overwrite the executeCommand handler to handle the response of
-- java.maven.addDependency.
-- TODO: is this necessary? How are code actions normally handled? add to vim.lsp.commands?
vim.lsp.handlers['workspace/executeCommand'] = function(err, result, ctx, config)
	if ctx.params.command == 'java.maven.addDependency' then
		-- Handle the response here
		if err then
			-- vim.print("Error:", err)
		else
			vim.print(result)
			vim.print(ctx)
			-- vim.print(result[2].documentChanges)
			vim.lsp.util.apply_workspace_edit(result[1], 'utf-8')
			vim.lsp.util.apply_workspace_edit(result[2], 'utf-8')
			vim.lsp.util.apply_workspace_edit(result[3], 'utf-8')
			-- vim.lsp.util.apply_text_document_edit(result[2].documentChanges, 'utf-8')
		end
	end
	executeCommandHandler(err, result, ctx, config)
end
