return {
	priority = 51,
	"stevearc/oil.nvim",
	opts = {
		columns = {
			"icon",
		},

		view_options = {
			show_hidden = true,
		},
	},
	config = function()
		require("oil").setup({
			keymaps = {
				["H"] = "actions.toggle_hidden",
			},
		})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
