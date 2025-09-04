-- Aki theme (standalone)
vim.cmd('highlight clear Normal')
vim.cmd('highlight clear')
vim.g.colors_name = 'aki'

-- Palette from your stylix file, with calculated intermediate shades
local C = {
  base00 = '#101317', -- darkest background
  base01 = '#22232E', -- bar background
  base02 = '#2C2D39', -- black
  base03 = '#454756', -- bright black
  base04 = '#D1CEC9', -- white
  base05 = '#E4E1DD', -- foreground
  base06 = '#99A3C2', -- inactive border
  base07 = '#BDC3E6', -- light periwinkle
  base08 = '#CA6D73', -- red
  base09 = '#E6C193', -- yellow/orange
  base0A = '#8BC47A', -- green
  base0B = '#9BC2B1', -- teal
  base0C = '#7EB3C9', -- blue
  base0D = '#78C2DF', -- bright blue
  base0E = '#A0BDBD', -- magenta/purple
  base0F = '#8D6B94', -- darker purple
  -- Intermediate shades (tweaked using midpoint/interpolation by eye for continuity)
  baseBg         = '#161922', -- between base00 & base01
  basePanel      = '#212432', -- slightly lighter than base01
  subtext0       = '#5B5970', -- between base03 & base04
  subtext1       = '#9699A3', -- between base06 & base04
  overlay0       = '#23263B', -- close to base02
  overlay1       = '#343A4C', -- between base02 & base03
  overlay2       = '#7F7999', -- between base06 & base0F
  accent1        = '#B798B6', -- between base0F & base04
  accent2        = '#B0BEE7', -- lighter variant of base07
}

local function hl_link(group, link)
  vim.api.nvim_set_hl(0, group, { link = link })
end

vim.api.nvim_set_hl(0, 'ColorColumn',   { bg = C.overlay0 })
vim.api.nvim_set_hl(0, 'CurSearch',     { fg = C.base05, bg = C.base0F })
vim.api.nvim_set_hl(0, 'Cursor',        { fg = C.base04, bg = C.base0D })
hl_link('CursorColumn', 'ColorColumn')
hl_link('CursorLine', 'CursorColumn')
vim.api.nvim_set_hl(0, 'CursorLineNr',  { fg = C.base05, bold = true })
vim.api.nvim_set_hl(0, 'DiffAdd',       { bg = C.base0B, fg = C.base01 })
vim.api.nvim_set_hl(0, 'DiffChange',    { bg = C.base0C, fg = C.base01 })
vim.api.nvim_set_hl(0, 'DiffDelete',    { bg = C.base08, fg = C.base01, bold = true })
hl_link('DiffText', 'Normal')
hl_link('DiffTextAdd', 'DiffAdd')
vim.api.nvim_set_hl(0, 'Directory',     { fg = C.base0D, bold = true })
vim.api.nvim_set_hl(0, 'EndOfBuffer',   {})
vim.api.nvim_set_hl(0, 'ErrorMsg',      { fg = C.base08, bold = true })
hl_link('FloatBorder', 'NormalFloat')
hl_link('FloatFooter', 'NormalFloat')
hl_link('FloatTitle', 'NormalFloat')
hl_link('Folded', 'Comment')
vim.api.nvim_set_hl(0, 'LineNr',        { fg = C.overlay2 })
vim.api.nvim_set_hl(0, 'MatchParen',    { bg = C.overlay1 })
vim.api.nvim_set_hl(0, 'ModeMsg',       { fg = C.base0A })
hl_link('MoreMsg', 'ModeMsg')
vim.api.nvim_set_hl(0, 'NonText',       { fg = C.overlay2 })
vim.api.nvim_set_hl(0, 'Normal',        { fg = C.base05, bg = C.base00 })
hl_link('NormalFloat', 'Normal')
hl_link('NormalNC', 'Normal')
vim.api.nvim_set_hl(0, 'Pmenu',         { fg = C.base05, bg = C.baseBg })
vim.api.nvim_set_hl(0, 'PmenuSel',      { fg = C.base00, bg = C.base07 })
hl_link('PmenuThumb', 'PmenuSel')
hl_link('Question', 'MoreMsg')
hl_link('QuickFixLine', 'Visual')
hl_link('Search', 'Substitute')
hl_link('SignColumn', 'Normal')
vim.api.nvim_set_hl(0, 'SpecialKey',    { fg = C.base0D, italic = true })
hl_link('StatusLine', 'ColorColumn')
hl_link('StdoutMsg', 'Normal')
hl_link('Substitute', 'Visual')
hl_link('TabLine', 'StatusLine')
vim.api.nvim_set_hl(0, 'TabLineSel',    { fg = C.base05, bg = C.basePanel, bold = true })
hl_link('TermCursor', 'Cursor')
vim.api.nvim_set_hl(0, 'Visual',        { fg = C.base01, bg = C.accent2 })
vim.api.nvim_set_hl(0, 'WarningMsg',    { fg = C.base09 })
vim.api.nvim_set_hl(0, 'WinSeparator',  { fg = C.overlay1 })
hl_link('lCursor', 'Cursor')
vim.api.nvim_set_hl(0, 'Comment',       { fg = C.subtext0, italic = true })
hl_link('Boolean', 'Number')
vim.api.nvim_set_hl(0, 'Character',     { fg = C.base0B })
vim.api.nvim_set_hl(0, 'Constant',      { fg = C.base0F, bold = true })
hl_link('Float', 'Number')
vim.api.nvim_set_hl(0, 'Number',        { fg = C.base08 })
vim.api.nvim_set_hl(0, 'String',        { fg = C.accent1 })
hl_link('Function', 'Normal')
hl_link('Identifier', 'Normal')
vim.api.nvim_set_hl(0, 'Operator',      { fg = C.accent1 })
vim.api.nvim_set_hl(0, 'Statement',     { fg = C.base0A, bold = true })
hl_link('PreProc', 'Statement')
vim.api.nvim_set_hl(0, 'StorageClass',  { fg = C.base09 })
vim.api.nvim_set_hl(0, 'Type',          { fg = C.accent2, bold = true })
hl_link('Delimiter', 'Operator')
hl_link('Special', 'SpecialKey')
vim.api.nvim_set_hl(0, 'SpecialComment',{ fg = C.base0A, italic = true })
vim.api.nvim_set_hl(0, 'Error',         { bg = C.base08 })
vim.api.nvim_set_hl(0, 'Todo',          { fg = C.base00, bg = C.base0B })

-- Git diff
hl_link('Added', 'DiffAdd')
hl_link('Changed', 'DiffChange')
hl_link('Removed', 'DiffDelete')

-- Treesitter and extras
hl_link('@comment.documentation', 'SpecialComment')
vim.api.nvim_set_hl(0, '@comment.error',   { fg = C.base04, bg = C.base08 })
vim.api.nvim_set_hl(0, '@comment.note',    { fg = C.base04, bg = C.base0D })
hl_link('@constant.builtin', '@constant')
hl_link('@constructor.lua', 'Delimiter')
hl_link('@function.builtin', '@function')
hl_link('@punctuation.special', '@punctuation')
hl_link('@variable', 'Identifier')
hl_link('@variable.builtin', 'Identifier')

