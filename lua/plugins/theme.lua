--kanagawa-dragon theme
--------------------------
-- return {
-- 	"rebelot/kanagawa.nvim",
-- 	name = "kanagawa",
-- 	priority = 1000,
-- 	config = function()
-- 		-- See the repo's README for this
--
-- 		require("kanagawa").setup({
-- 			overrides = function(colors)
-- 				local theme = colors.theme
-- 				return {
-- 					Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 }, -- add `blend = vim.o.pumblend` to enable transparency
-- 					PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
-- 					PmenuSbar = { bg = theme.ui.bg_m1 },
-- 					PmenuThumb = { bg = theme.ui.bg_p2 },
-- 				}
-- 			end,
-- 			colors = {
-- 				theme = {
-- 					all = {
-- 						ui = {
-- 							-- bg_gutter = "none",
-- 						},
-- 					},
-- 				},
-- 			},
-- 		})
--
-- 		vim.cmd.colorscheme("kanagawa-dragon")
-- 	end,
-- }
--------------------------
--catpuccin theme
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavour = "mocha",
-- 			transparent_background = true,
-- 			integrations = {
-- 				treesitter = true,
-- 				native_lsp = { enabled = true },
-- 				cmp = true,
-- 				fidget = true,
-- 				telescope = true,
-- 				gitsigns = true,
-- 				which_key = true,
-- 				mini = true,
-- 				flash = true,
-- 			},
-- 		})
-- 		vim.api.nvim_set_hl(0, "FloatBorder", {})
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
-- 		vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
-- 		vim.api.nvim_set_hl(0, "LineNr", { link = "Normal" })
-- 		vim.api.nvim_set_hl(0, "LineNrAbove", { link = "Comment" })
-- 		vim.api.nvim_set_hl(0, "LineNrBelow", { link = "Comment" })
-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- }
--

-- aki theme
return {
	"crispybaccoon/aki",
	config = function()
		-- require to trigger population of aki_colors table
		require("aki.colors")
		_G.aki_colors = vim.tbl_deep_extend("force", _G.aki_colors, { bg3 = _G.aki_colors.fg2 })
		require("aki").setup({
			transparent_background = false,
			contrast_dark = "medium",
			contrast_light = "medium",
			emphasis = {
				general = { italic = true },
				comment = {},
				keyword = { italic = true },
				type = { type = true },
			},
			override_terminal = true,
			style = {
				cursorline = { soft = true, contrast_currentline = false },
				tabline = { reverse = true, color = "seiun" },
				search = { reverse = false, color = "sakaeru" },
			},
			overrides = {}, -- add custom overrides
			plugins = true,
		})
		vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
		vim.api.nvim_set_hl(0, "LineNr", { link = "Normal" })
		vim.api.nvim_set_hl(0, "LineNrAbove", { link = "Comment" })
		vim.api.nvim_set_hl(0, "LineNrBelow", { link = "Comment" })
		vim.api.nvim_set_hl(0, "@variable.member", { link = "TSField" })
		vim.cmd.colorscheme("aki")
		vim.api.nvim_set_hl(0, "Normal", { bg = "#101317", fg = "#D4D4D5" })
		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
		vim.api.nvim_set_hl(0, "FloatBorder", {link = "Normal"})
		vim.api.nvim_set_hl(0, "Visual", { cterm = none, ctermfg = none, ctermbg = 237, bg = "#454756" })
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

--------------------------
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
