local function qf_delete_entry()
	local current = vim.fn.line(".")
	local qflist = vim.fn.getqflist()

	table.remove(qflist, current)
	vim.fn.setqflist(qflist, "r")
	vim.fn.execute(":" .. tostring(current))
end

vim.keymap.set("n", "dd", qf_delete_entry, { buffer = true })

-- local namespace = vim.api.nvim_create_namespace("diagnostics")
-- local group = vim.api.nvim_create_augroup("diagnostics", { clear = true })
-- local buffer = vim.api.nvim_get_current_buf()
--
-- vim.api.nvim_create_autocmd("QuickFixCmdPost", {
-- 	group = group,
-- 	buffer = buffer,
-- 	callback = function()
-- 		-- Get the current contents of the quickfix list
-- 		local qflist = vim.fn.getqflist()
--
-- 		-- Convert it to `vim.diagnostic`'s format
-- 		local diagnostics = vim.diagnostic.fromqflist(qflist)
--
-- 		-- Clear all previous diagnostics
-- 		vim.api.nvim_buf_clear_namespace(buffer, namespace, 0, -1)
--
-- 		-- Set the new diagnostics
-- 		vim.diagnostic.set(namespace, buffer, diagnostics)
-- 	end,
-- })
