return {
	priority = 51,
	"stevearc/oil.nvim",
	opts = {
		default_file_explorer = true,
		delete_to_trash = true,
		columns = {
			"icon",
		},

		view_options = {
			show_hidden = true,
			-- natural_order = true,
		},

	},
	config = function()
		require("oil").setup({
			keymaps = {
				["<C-h>"] = false,
				["<C-l>"] = false,
				["H"] = "actions.toggle_hidden",
			},
		})
		vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
	end,
}
