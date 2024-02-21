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
	commit = "53c72e1c30f13646515314da96f098e0dfc150a1",
	config = function()
		require("aki").setup({
			transparent_background = false,
			contrast_dark = "medium", -- 'hard'|'medium'|'soft'
			override_terminal = true,
			style = {
				search = { reverse = false },
			},
			overrides = {
			}, -- add custom overrides
		})
		vim.api.nvim_set_hl(0, "FloatBorder", {})
		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
		vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
		vim.api.nvim_set_hl(0, "LineNr", { link = "Normal" })
		vim.api.nvim_set_hl(0, "LineNrAbove", { link = "Comment" })
		vim.api.nvim_set_hl(0, "LineNrBelow", { link = "Comment" })
		vim.api.nvim_set_hl(0, "@variable.member", { link = "TSField" })
		vim.api.nvim_set_hl(0, "@tag.scss", { link = "TSField" })
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
--
--
--
------------------------------
-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function ()
-- 		require("rose-pine").setup({
--     variant = "auto", -- auto, main, moon, or dawn
--     dark_variant = "main", -- main, moon, or dawn
--     dim_inactive_windows = false,
--     extend_background_behind_borders = true,
--
--     enable = {
--         terminal = true,
--         legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--         migrations = true, -- Handle deprecated options automatically
--     },
--
--     styles = {
--         bold = true,
--         italic = true,
--         transparency = false,
--     },
--
--     groups = {
--         border = "muted",
--         link = "iris",
--         panel = "surface",
--
--         error = "love",
--         hint = "iris",
--         info = "foam",
--         note = "pine",
--         todo = "rose",
--         warn = "gold",
--
--         git_add = "foam",
--         git_change = "rose",
--         git_delete = "love",
--         git_dirty = "rose",
--         git_ignore = "muted",
--         git_merge = "iris",
--         git_rename = "pine",
--         git_stage = "iris",
--         git_text = "rose",
--         git_untracked = "subtle",
--
--         h1 = "iris",
--         h2 = "foam",
--         h3 = "rose",
--         h4 = "gold",
--         h5 = "pine",
--         h6 = "foam",
--     },
--
--     highlight_groups = {
--         -- Comment = { fg = "foam" },
--         -- VertSplit = { fg = "muted", bg = "muted" },
--     },
--
--     before_highlight = function(group, highlight, palette)
--         -- Disable all undercurls
--         -- if highlight.undercurl then
--         --     highlight.undercurl = false
--         -- end
--         --
--         -- Change palette colour
--         -- if highlight.fg == palette.pine then
--         --     highlight.fg = palette.foam
--         -- end
--     end,
-- })
--
-- vim.cmd.colorscheme("rose-pine-main")
-- -- vim.cmd("colorscheme rose-pine-main")
-- -- vim.cmd("colorscheme rose-pine-moon")
-- -- vim.cmd("colorscheme rose-pine-dawn")
-- 	end
-- }

-------------------------------
--
--boo 





-- return {
-- 'rockerBOO/boo-colorscheme-nvim',
-- config = function ()
-- 	require('boo-colorscheme').use({ theme = 'crimson_moonlight' })
-- 		vim.cmd.colorscheme("crimson_moonlight")
-- end
--
-- }
--
