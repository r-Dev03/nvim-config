return {
	{
		"nvim-lualine/lualine.nvim",
		dependecies = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = true,
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
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
						"encoding",
						"fileformat",
						"filetype",
					},
					lualine_y = {
						"progress",
					},
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
-- require('lualine').setup {
--   options = {
--     icons_enabled = true,
--     component_separators = { left = '', right = '' },
--     section_separators = { left = ' ', right = ' ' },
--     disabled_filetypes = {
--       statusline = {},
--       winbar = {},
--     },
--     ignore_focus = {},
--     always_divide_middle = true,
--     refresh = {
--       statusline = 1000,
--     },
--   },
--   sections = {
--     lualine_a = { {
--       'mode',
--       fmt = function(str)
--         return str:sub(1, 1)
--       end,
--     } },
--     lualine_b = {
--       'branch',
--       'diff',
--       'diagnostics',
--     },
--     lualine_c = {
-- { 'filename', path = 1, symbols = { modified = '*' } },
--     },
--     lualine_x = {
--       '%S', -- showcmd, requires showcmdloc=statusline
--       'filetype',
--       'progress',
--     },
--     lualine_y = {},
--     lualine_z = { 'location' },
--   },
-- }
--
-- local lualine_nvim_opts = require 'lualine.utils.nvim_opts'
-- local base_set = lualine_nvim_opts.set
--
-- lualine_nvim_opts.set = function(name, val, scope)
--   if vim.env.TMUX ~= nil and name == 'statusline' then
--     if scope and scope.window == vim.api.nvim_get_current_win() then
--       vim.g.tpipeline_statusline = val
--       vim.cmd 'silent! call tpipeline#update()'
--     end
--     return
--   end
--   return base_set(name, val, scope)
-- end
