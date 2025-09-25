-- Enabling the LSP's
vim.lsp.enable({
	"clangd",
	"lua_ls",
	"nil_ls",
	"rust_analyzer",
	"sqls",
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
    underline = false,
    virtual_text = false,
    virtual_lines = false,
		severity_sort = true,
		signs = {

			text = {
		 	 [vim.diagnostic.severity.ERROR] = "",
		 	 [vim.diagnostic.severity.WARN] = "",
		 	 [vim.diagnostic.severity.HINT] = "",
		 	 [vim.diagnostic.severity.INFO] = "",
			},

			linehl = {
			 [vim.diagnostic.severity.ERROR] = "ErrorMsg",
		 	 [vim.diagnostic.severity.WARN] = "None",
		 	 [vim.diagnostic.severity.HINT] = "None",
		 	 [vim.diagnostic.severity.INFO] = "None",
			},

			numhl = {
		 	 [vim.diagnostic.severity.ERROR] = "ErrorMsg",
		 	 [vim.diagnostic.severity.WARN] = "WarningMsg",
		 	 [vim.diagnostic.severity.HINT] = "DiagnosticHint",
		 	 [vim.diagnostic.severity.INFO] = "DiagnosticHint",
			},
		},

    float = {
			title = " Diagnostic ",
			header = "",
			border = "single",
			scope = "line",
	},
}
