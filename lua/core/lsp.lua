-- Enabling the LSP's
vim.lsp.enable({
	"clangd",
	"lua_ls",
	"rust_analyzer",
	"ts_ls",
	"sqls",
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

		-- Keymaps
		vim.keymap.set('n', 'K', function() vim.lsp.buf.hover { border = 'rounded', title = ' hover ' } end, {
			desc = 'Hover Documentation',
			buffer = event.buf,
		})
		vim.keymap.set("n", "gd", vim.lsp.buf.definition)
		vim.keymap.set("n", "gr", vim.lsp.buf.references)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
		vim.keymap.set("n", "<leader>od", function() vim.diagnostic.open_float() end)
	end,
})

-- Diagnostics
  vim.diagnostic.config {
    signs = false,
    underline = true,
    virtual_text = false,
    virtual_lines = false,
    float = {
      header = false,
      border = 'rounded',
      focusable = true,
	},
}
