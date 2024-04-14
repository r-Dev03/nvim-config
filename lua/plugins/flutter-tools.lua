return {
	"akinsho/flutter-tools.nvim",
	lazy = false,
	config = function()
		dependencies = {
			"nvim-lua/plenary.nvim",
			"stevearc/dressing.nvim", -- optional for vim.ui.select
		}
	end,
}
