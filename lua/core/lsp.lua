-- Enabling the LSP's
vim.lsp.enable({
	"clangd",
	"lua_ls",
	"rust_analyzer",
	"ts_ls",
})

-- Semantic tokens removal
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-on-attach", { clear = true }),
	callback = function(event)
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		assert(client, "LSP client crashed?")
		client.server_capabilities.semanticTokensProvider = nil
		vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
			border = "rounded",
			title = "hover",
		})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition)
		vim.keymap.set("n", "gr", vim.lsp.buf.references)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
		vim.keymap.set("n", "K", vim.lsp.buf.hover)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)

		vim.keymap.set('n', '<leader>k', function()
			vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = false })

			vim.api.nvim_create_autocmd('CursorMoved', {
				group = vim.api.nvim_create_augroup('line-diagnostics', { clear = true }),
				callback = function()
					vim.diagnostic.config({ virtual_lines = false})
					return true
				end,
			})
		end)
	end,
})

-- Diagnostics
vim.diagnostic.config({
	virtual_lines = false

	-- Alternatively, customize specific options
	-- virtual_lines = {
		-- Only show virtual line diagnostics for the current cursor line
	-- 	current_line = true,
	-- },
})
