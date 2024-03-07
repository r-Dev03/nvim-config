return {
	{
		"nvim-lualine/lualine.nvim",
		dependecies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			local theme = require("aki.colors").setup({})

			local colors = {
				normal = theme.syntax.constant[1],
				visual = theme.syntax.annotation[1],
				insert = theme.syntax.call[1],

				fg0 = theme.fg0[1],
				fg1 = theme.fg1[1],
				fg2 = "#707378",
				fg3 = "#5e666a",
				bg0 = theme.bg[1],
				bg1 = theme.bg1[1],
				bg2 = theme.bg2[1],
				bg3 = "#1d2529",
				bg4 = "#111419",
			}

			local adachi = {}

			adachi.normal = {
				a = { fg = colors.fg2, bg = colors.bg3 },
				b = { bg = colors.bg4, fg = colors.fg3 },
				c = { bg = colors.bg4, fg = colors.fg3 },
			}

			adachi.insert = {
				a = { fg = colors.bg0, bg = colors.insert },
				b = { bg = colors.bg0, fg = colors.insert },
			}

			adachi.command = adachi.normal

			adachi.visual = {
				a = { fg = colors.bg0, bg = colors.visual },
				b = { bg = colors.bg0, fg = colors.visual },
			}

			adachi.replace = adachi.insert

			adachi.inactive = {
				a = { bg = colors.bg4, fg = colors.fg3 },
				b = { bg = colors.bg4, fg = colors.fg3 },
				c = { bg = colors.bg3, fg = colors.fg2 },
				x = { bg = colors.bg3, fg = colors.fg2 },
			}

			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = adachi,
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
