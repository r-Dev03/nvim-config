return {
	"neovim/nvim-lspconfig",
	-- event = "VeryLazy",
	config = function()
		local lspconfig = require("lspconfig")
		local win = require("lspconfig.ui.windows")
		win.default_options.border = "rounded"

		lspconfig.tsserver.setup({})

		lspconfig.rnix.setup({})

		lspconfig.typst_lsp.setup({})

		lspconfig.clangd.setup({})

		lspconfig.lua_ls.setup({})

		lspconfig.pyright.setup({})

		lspconfig.gopls.setup({})

		lspconfig.eslint.setup({})

		lspconfig.jdtls.setup({})

		lspconfig.html.setup({})

		lspconfig.cssls.setup({})

		lspconfig.vale_ls.setup({})

		lspconfig.dartls.setup({})

		lspconfig.tailwindcss.setup({
			autostart = false,
		})

		lspconfig.matlab_ls.setup({
			root_dir = function(fname)
				return vim.fn.getcwd()
			end,
			settings = {
				MATLAB = {
					indexWorkspace = false,
					matlabConnectionTiming = "onStart",
					installPath = "/Applications/MATLAB_R2023b.app/",
					telemetry = false,
				},
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

		-- Another cool thing is `:help LspAttach`
		--   (this is an autocommand, see `:help autocmd` and `:help nvim_create_autocmd`)
		--
		-- This autocmd will run when any of your language servers attaches, so you can put LSP specific
		-- configuration like keymaps there
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("lsp-on-attach", { clear = true }),
			callback = function(event)
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				assert(client, "LSP client crashed?")
				client.server_capabilities.semanticTokensProvider = nil
				vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
					-- -- Use a sharp border with `FloatBorder` highlights
					border = "rounded",
					-- -- add the title in hover float window
					title = "hover",
				})
				-- In here you can run any setup code you want to apply to all your language servers.
				-- For server specific setups, see `on_attach` for lspconfig
				vim.keymap.set("n", "gd", vim.lsp.buf.definition)
				vim.keymap.set("n", "gr", vim.lsp.buf.references)
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
				vim.keymap.set("n", "K", vim.lsp.buf.hover)
				vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
			end,
		})
	end,
}
