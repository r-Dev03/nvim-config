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
-- return {
-- 	"crispybaccoon/aki",
-- 	commit = "53c72e1c30f13646515314da96f098e0dfc150a1",
-- 	config = function()
-- 		require("aki").setup({
-- 			transparent_background = false,
-- 			contrast_dark = "medium", -- 'hard'|'medium'|'soft'
-- 			override_terminal = true,
-- 			style = {
-- 				search = { reverse = false },
-- 			},
-- 			overrides = {}, -- add custom overrides
-- 		})
-- 		vim.api.nvim_set_hl(0, "FloatBorder", {})
-- 		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
-- 		vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Normal" })
-- 		vim.api.nvim_set_hl(0, "LineNr", { link = "Normal" })
-- 		vim.api.nvim_set_hl(0, "LineNrAbove", { link = "Comment" })
-- 		vim.api.nvim_set_hl(0, "LineNrBelow", { link = "Comment" })
-- 		vim.api.nvim_set_hl(0, "@variable.member", { link = "TSField" })
-- 		vim.cmd.colorscheme("aki")
-- 	end,
-- }

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
-- Dawn
vim.cmd.highlight("clear")
vim.g.colors_name = "dawn"

local C = {
  rosewater = "#F5E0DC",
  flamingo = "#F2CDCD",
  pink = "#F5C2E7",
  mauve = "#CBA6F7",
  red = "#F38BA8",
  maroon = "#EBA0AC",
  peach = "#FAB387",
  yellow = "#F9E2AF",
  green = "#A6E3A1",
  teal = "#94E2D5",
  sky = "#89DCEB",
  sapphire = "#74C7EC",
  blue = "#89B4FA",
  lavender = "#B4BEFE",
  text = "#CDD6F4",
  subtext1 = "#BAC2DE",
  subtext0 = "#A6ADC8",
  overlay2 = "#9399B2",
  overlay1 = "#7F849C",
  overlay0 = "#6C7086",
  surface2 = "#585B70",
  surface1 = "#45475A",
  surface0 = "#313244",
  base = "#1E1E2E",
  mantle = "#181825",
  crust = "#11111B",
  none = "NONE",
  slate = "#3C5E7F",
  poggers = "#7480C2",
  white = "#FFFFFF",
}

local highlights = {
  -- editor
  ["ColorColumn"] = { bg = C.mantle },
  ["Conceal"] = { fg = C.overlay0 },
  ["CurSearch"] = { fg = C.crust, bg = C.poggers },
  ["Cursor"] = { fg = C.crust, bg = C.poggers },
  ["lCursor"] = { link = "Cursor" },
  ["CursorIM"] = { link = "Cursor" },
  ["CursorColumn"] = { link = "ColorColumn" },
  ["CursorLine"] = { link = "ColorColumn" },
  ["DiagnosticOk"] = { fg = C.green, italic = true },
  ["DiagnosticHint"] = { fg = C.teal },
  ["DiagnosticInfo"] = { fg = C.blue },
  ["DiagnosticWarn"] = { fg = C.yellow },
  ["DiagnosticError"] = { fg = C.red },
  ["DiagnosticSignOk"] = { link = "DiagnosticOk" },
  ["DiagnosticSignHint"] = { link = "DiagnosticHint" },
  ["DiagnosticSignInfo"] = { link = "DiagnosticInfo" },
  ["DiagnosticSignWarn"] = { link = "DiagnosticWarn" },
  ["DiagnosticSignError"] = { link = "DiagnosticError" },
  ["DiagnosticFloatingOk"] = { link = "DiagnosticOk" },
  ["DiagnosticFloatingHint"] = { link = "DiagnosticHint" },
  ["DiagnosticFloatingInfo"] = { link = "DiagnosticInfo" },
  ["DiagnosticFloatingWarn"] = { link = "DiagnosticWarn" },
  ["DiagnosticFloatingError"] = { link = "DiagnosticError" },
  ["DiagnosticVirtualTextOk"] = { link = "DiagnosticOk" },
  ["DiagnosticVirtualTextHint"] = { link = "DiagnosticHint" },
  ["DiagnosticVirtualTextInfo"] = { link = "DiagnosticInfo" },
  ["DiagnosticVirtualTextWarn"] = { link = "DiagnosticWarn" },
  ["DiagnosticVirtualTextError"] = { link = "DiagnosticError" },
  ["DiagnosticUnnecessary"] = { link = "Comment" },
  ["DiagnosticUnderlineOk"] = { link = "NONE" },
  ["DiagnosticUnderlineHint"] = { link = "NONE" },
  ["DiagnosticUnderlineInfo"] = { link = "NONE" },
  ["DiagnosticUnderlineWarn"] = { link = "NONE" },
  ["DiagnosticUnderlineError"] = { link = "NONE" },
  ["DiagnosticDeprecated"] = { link = "DiagnosticUnnecessary" },
  ["Directory"] = { fg = C.blue },
  ["DiffAdd"] = { fg = C.green, bold = true },
  ["DiffChange"] = { fg = C.blue },
  ["DiffDelete"] = { fg = C.red, bold = true },
  ["DiffText"] = { link = "Normal" },
  ["EndOfBuffer"] = { fg = C.slate },
  ["TermCursor"] = { bg = C.subtext0 },
  ["TermCursorNC"] = { link = "TermCursor" },
  ["ErrorMsg"] = { fg = C.red, bold = true },
  ["WinSeparator"] = { fg = C.text, bg = C.none },
  ["Folded"] = { link = "Comment" },
  ["FoldColumn"] = { bg = C.crust },
  ["SignColumn"] = { bg = C.crust },
  ["IncSearch"] = { link = "CurSearch" },
  ["Substitute"] = { link = "IncSearch" },
  ["LineNr"] = { fg = C.surface0, bg = C.crust },
  ["LineNrAbove"] = { link = "LineNr" },
  ["LineNrBelow"] = { link = "LineNr" },
  ["LspReferenceText"] = { link = "MatchParen" },
  ["LspInlayHint"] = { fg = C.slate },
  ["CursorLineNr"] = { fg = C.yellow },
  ["CursorLineFold"] = {},
  ["CursorLineSign"] = { link = "SignColumn" },
  ["MatchParen"] = { bg = C.surface0 },
  ["ModeMsg"] = { fg = C.mauve, italic = true },
  ["MsgArea"] = {},
  ["MsgSeparator"] = {},
  ["MoreMsg"] = {},
  ["NonText"] = {},
  ["Normal"] = { fg = C.text, bg = C.crust },
  ["NormalFloat"] = { bg = C.none },
  ["FloatBorder"] = { link = "NormalFloat" },
  ["FloatTitle"] = { link = "NormalFloat" },
  ["FloatFooter"] = { link = "NormalFloat" },
  ["NormalNC"] = { link = "Normal" },
  ["Pmenu"] = { fg = C.overlay0, bg = C.base },
  ["PmenuSel"] = { fg = C.text, bg = C.mantle },
  ["PmenuKind"] = { fg = C.mauve, bg = C.base },
  ["PmenuKindSel"] = { fg = C.mauve, bg = C.mantle },
  ["PmenuExtra"] = { fg = C.mauve, bg = C.base },
  ["PmenuExtraSel"] = { fg = C.mauve, bg = C.mantle },
  ["PmenuSbar"] = { fg = C.mantle },
  ["PmenuThumb"] = { fg = C.surface0 },
  ["Question"] = {},
  ["QuickFixLine"] = { bg = C.base },
  ["qfLineNr"] = { link = "LineNr" },
  ["qfFileName"] = { fg = C.blue },
  ["Search"] = { fg = C.crust, bg = C.yellow },
  ["SpecialKey"] = {},
  ["SpellBad"] = {},
  ["SpellCap"] = {},
  ["SpellLocal"] = {},
  ["SpellRare"] = {},
  ["StatusLine"] = { link = "Normal" },
  ["StatusLineNC"] = { link = "NormalNC" },
  ["StatusLineSeparator"] = { fg = C.lavender, bg = C.crust },
  ["StatusLineText"] = { fg = C.text, bg = C.crust },
  ["StatusLineGitBranch"] = { fg = C.yellow, bg = C.crust },
  ["TabLine"] = { fg = C.overlay0, bg = C.crust },
  ["TabLineFill"] = { fg = C.crust, bg = C.crust },
  ["TabLineSel"] = { fg = C.text, bg = C.crust },
  ["Title"] = {},
  ["Visual"] = { bg = C.surface0 },
  ["VisualNOS"] = { link = "Visual" },
  ["WarningMsg"] = { fg = C.peach, bold = true },
  ["Whitespace"] = { fg = C.base },
  ["WildMenu"] = { fg = C.poggers, bg = C.base },
  ["WinBar"] = { fg = C.blue, bg = C.crust },
  ["WinBarNC"] = { link = "WinBar" },

  -- syntax
  ["Comment"] = { fg = C.slate },
  ["Constant"] = { fg = C.white, bold = true },
  ["String"] = { fg = C.green },
  ["Character"] = { fg = C.sky },
  ["Number"] = { fg = C.red },
  ["Boolean"] = { fg = C.red },
  ["Float"] = { link = "Number" },
  ["Identifier"] = { fg = C.text },
  ["Function"] = { fg = C.blue },
  ["Statement"] = {},
  ["Conditional"] = { fg = C.mauve },
  ["Repeat"] = { fg = C.mauve },
  ["Label"] = { fg = C.sapphire },
  ["Operator"] = { fg = C.overlay1 },
  ["Keyword"] = { fg = C.mauve },
  ["Exception"] = { fg = C.red, bold = true },
  ["PreProc"] = { fg = C.sapphire },
  ["Include"] = { link = "Keyword" },
  ["Define"] = { link = "PreProc" },
  ["Macro"] = { link = "PreProc" },
  ["PreCondit"] = { link = "PreProc" },
  ["Type"] = { fg = C.poggers },
  ["StorageClass"] = { fg = C.mauve },
  ["Structure"] = { link = "Type" },
  ["Typedef"] = { link = "Type" },
  ["Special"] = {},
  ["SpecialChar"] = { fg = C.pink },
  ["Tag"] = { fg = C.maroon },
  ["Delimiter"] = { fg = C.overlay0 },
  ["SpecialComment"] = { fg = C.slate, italic = true },
  ["Debug"] = {},
  ["Ignore"] = {},
  ["Error"] = {},
  ["Todo"] = { fg = C.sky, bold = true },

  -- treesitter
  ["@constant.builtin"] = { fg = C.peach },
  ["@constant.rust"] = { fg = C.peach },
  ["@constructor.lua"] = { link = "Delimiter" },
  ["@field"] = { fg = C.lavender },
  ["@function.builtin"] = { fg = C.peach },
  ["@function.macro"] = { link = "Macro" },
  ["@keyword.operator"] = { link = "Keyword" },
  ["@keyword.storage.lifetime"] = { fg = C.sapphire },
  ["@markup.heading"] = { link = "@text.title" },
  ["@markup.link"] = { link = "@text.reference" },
  ["@markup.raw"] = { link = "@text.literal" },
  ["@module"] = { link = "@namespace" },
  ["@namespace"] = { fg = C.lavender },
  ["@parameter"] = { fg = C.maroon },
  ["@property"] = { fg = C.lavender },
  ["@punctuation.special"] = { link = "Delimiter" },
  ["@tag.delimiter"] = { link = "Delimiter" },
  ["@text.literal"] = { fg = C.overlay0 },
  ["@text.note"] = { fg = C.pink },
  ["@text.reference"] = { fg = C.maroon, italic = true },
  ["@text.strong"] = { bold = true },
  ["@text.title"] = { fg = C.poggers, bold = true },
  ["@text.uri"] = { fg = C.blue, italic = true, underline = true },
  ["@type.builtin"] = { link = "@type" },
  ["@type.qualifier"] = { fg = C.yellow },
  ["@variable"] = { link = "Identifier" },
  ["@variable.builtin"] = { fg = C.red },
  ["@variable.member"] = { link = "@field" },
  ["@variable.parameter"] = { link = "@parameter" },

  -- telescope
  ["TelescopeMatching"] = { fg = C.poggers, bold = true },
  ["TelescopeNormal"] = { fg = C.text, bg = C.none },
  ["TelescopePreviewLine"] = { link = "TelescopeSelection" },
  ["TelescopeSelection"] = { link = "CursorLine" },
}

for group, attributes in pairs(highlights) do
  vim.api.nvim_set_hl(0, group, attributes)
end

local terminal_colors = {
  C.overlay0,
  C.red,
  C.green,
  C.yellow,
  C.blue,
  C.pink,
  C.sky,
  C.text,
  C.overlay1,
  C.red,
  C.green,
  C.yellow,
  C.blue,
  C.pink,
  C.sky,
  C.text,
}

for idx, color in ipairs(terminal_colors) do
  vim.g["terminal_color_" .. tostring(idx - 1)] = color
end

vim.cmd.colorscheme("dawn")


