return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")
		require("conform").setup({
			formatters_by_ft = {
				c = { "clang_format" },
				javascript = { "eslint_d", "prettierd" },
				typescript = { "prettierd" },
				markdown = { "prettierd" },
				css = { "prettierd" },
				html = { "prettierd" },
				json = { "prettierd" },
				sh = { "beautysh" },
				lua = { "stylua" },
				python = { "black", "isort" },
				rust = { "rustfmt" },
			},
		})

	--test
		vim.keymap.set("n", "<leader>f", conform.format)
	end,
}
