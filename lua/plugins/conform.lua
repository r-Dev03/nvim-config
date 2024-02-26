return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang_format" },
				javascript = {"prettier" },
				typescript = { "prettier" },
				markdown = { "prettier" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				sh = { "beautysh" },
				lua = { "stylua" },
				python = { "black", "isort" },
				-- rust = { "rustfmt" },
			},
		})

		vim.keymap.set("n", "<leader>f", conform.format)
	end,
}
