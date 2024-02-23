return {
	{
		"nvim-lualine/lualine.nvim",
		dependecies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			local vim_symbol = ""
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
					disabled_filetypes = {
						statusline = {},
						winbar = {},
					},
					ignore_focus = {},
					always_divide_middle = true,
					globalstatus = false,
					refresh = {
						statusline = 1000,
						tabline = 1000,
						winbar = 1000,
					},
				},
				sections = {
					lualine_a = {
						{
							"mode",
							fmt = function(str)
								return str:sub(1, 1)
							end,
						},
					},
					lualine_b = {
						"branch",
						"diff",
						"diagnostics",
					},
					lualine_c = {
						"filename",
					},
					lualine_x = {
						{
							"fileformat",
							symbols = { unix = "", dos = "" },
						},
						"filetype",
					},
					lualine_y = {},
					lualine_z = {
						"location",
					},
				},
				inactive_sections = {
					lualine_a = {},
					lualine_b = {},
					lualine_c = { "filename" },
					lualine_x = { "location" },
					lualine_y = {},
					lualine_z = {},
				},
				tabline = {},
				winbar = {},
				inactive_winbar = {},
				extensions = {},
			})
		end,
	},
}
