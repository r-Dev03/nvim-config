return {
	"lukas-reineke/indent-blankline.nvim",
	event = "BufAdd",
	config = function()
		require("ibl").setup({
			scope = {
				show_start = false,
				show_end = false,
			},
		})
	end,
	main = "ibl",
}
