return {
	{
		"nvim-lualine/lualine.nvim",
		dependecies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({})
		end,
	},
}
