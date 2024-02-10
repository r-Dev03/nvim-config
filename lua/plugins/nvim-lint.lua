return {
	"mfussenegger/nvim-lint",
	event = "VeryLazy",
	config = function()
		require("lint").linters_by_ft = {
			markdown = { "vale" },
			lua = { "luacheck" },
			javascript = { "eslint" },
			javascriptreact = { "eslint" },
			svelte = { "eslint" },
			typescript = { "eslint" },
			typescriptreact = { "eslint" },
		}

		vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
			callback = function()
				require("lint").try_lint()
			end,
		})
	end,
}
