return {
	"neovim/nvim-lspconfig",
	dependencies = { "saghen/blink.cmp" },
	config = function()
		local lspconfig = require("lspconfig")
		local capabilities = require("blink.cmp").get_lsp_capabilities()

		lspconfig.ts_ls.setup({
			capabilities = capabilities,
		})

		lspconfig.nixd.setup({
			capabilities = capabilities,
		})

		lspconfig.clangd.setup({
			capabilities = capabilities,
		})

		lspconfig.lua_ls.setup({
			capabilities = capabilities,
		})

		lspconfig.pyright.setup({
			capabilities = capabilities,
		})

		lspconfig.gopls.setup({
			capabilities = capabilities,
		})

		lspconfig.eslint.setup({
			capabilities = capabilities,
		})

		lspconfig.jdtls.setup({
			capabilities = capabilities,
		})

		lspconfig.html.setup({
			capabilities = capabilities,
		})

		lspconfig.cssls.setup({
			capabilities = capabilities,
		})

		lspconfig.vale_ls.setup({
			capabilities = capabilities,
		})

		lspconfig.tailwindcss.setup({
			capabilities = capabilities,
			autostart = false,
		})

		lspconfig.matlab_ls.setup({
			root_dir = function(fname)
				return vim.fn.getcwd()
			end,
			settings = {
				capabilities = capabilities,
			},
		})

		lspconfig.rust_analyzer.setup({
			settings = {
				["rust-analyzer"] = {
					check = {
						command = "clippy",
						extraArgs = { "--tests" },
						features = "all",
					},
				},
			},
		})

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

				-- add this inside your LspAttach autocommand callback:
				vim.keymap.set('n', 'K', function() vim.lsp.buf.hover { border = 'rounded', title = ' hover ' } end, {
					desc = 'Hover Documentation',
					buffer = event.buf,
				})
				vim.keymap.set("n", "gd", vim.lsp.buf.definition)
				vim.keymap.set("n", "gr", vim.lsp.buf.references)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
				-- vim.keymap.set("n", "K", vim.lsp.buf.hover)
				-- Work around for now
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
			end,
		})
	end,
}
