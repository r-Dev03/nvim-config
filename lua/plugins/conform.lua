return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang_format" },
				javascript = { "prettier" },
				typescript = { "prettier" },
				markdown = { "prettier" },
				nix = { "alejandra" },
				typst = { "typstfmt" },
				css = { "prettier" },
				html = { "prettier" },
				json = { "prettier" },
				sh = { "beautysh" },
				lua = { "stylua" },
				python = { "black", "isort" },
			},
		})

		vim.keymap.set("n", "<leader>f", conform.format)
	end,
}
