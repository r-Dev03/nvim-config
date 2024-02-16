--kanagawa-dragon theme
--------------------------
-- return {
-- 	"rebelot/kanagawa.nvim",
--
-- 	name = "kanagawa",
-- 	priority = 1000,
-- 	config = function()
-- 		-- See the repo's README for this
-- 		require("kanagawa").setup({
-- 			colors = {
-- 				theme = {
-- 					all = {
-- 						ui = {
-- 							bg_gutter = "none"
-- 						},
-- 					},
-- 				},
-- 			}
-- 		})
--
-- 		vim.cmd.colorscheme("kanagawa-dragon")
-- 	end,
-- }
--------------------------

-- aki theme
return {
	"crispybaccoon/aki",
	config = function()
		require("aki").setup({
			transparent_background = false,
			contrast_dark = "medium", -- 'hard'|'medium'|'soft'
			override_terminal = true,
			style = {
				search = { reverse = false },
			},
			overrides = {}, -- add custom overrides
		})
		vim.api.nvim_set_hl(0, "FloatBorder", {})
		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
		vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
		vim.api.nvim_set_hl(0, "LineNr", { link = "Normal" })
		vim.api.nvim_set_hl(0, "LineNrAbove", { link = "Comment" })
		vim.api.nvim_set_hl(0, "LineNrBelow", { link = "Comment" })
		vim.api.nvim_set_hl(0, "@variable.member", { link = "TSField" })
		vim.cmd.colorscheme("aki")
	end,
}

--------------------------

-- Nightfox theme

-- return {
-- 	"EdenEast/nightfox.nvim",
-- 	config = function()
-- 		vim.cmd.colorscheme("duskfox")
-- 	end,
-- }
