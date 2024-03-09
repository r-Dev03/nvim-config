return {
	"lewis6991/gitsigns.nvim",
	event = "BufAdd",

	config = function()
		require("gitsigns").setup()
	end,
}
