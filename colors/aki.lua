-- Clear existing highlights
vim.cmd('highlight clear')
if vim.g.syntax_on then
  vim.cmd('syntax reset')
end

vim.g.colors_name = 'aki'

-- Enable 24-bit colors
vim.opt.termguicolors = true

-- Define colors directly (from your stylix base16 configuration)
local c = {
  bg = '#101317',       -- base00 - background (darkest)
  fg = '#E4E1DD',       -- base05 - foreground (lightest)
  red = '#CA6D73',      -- base08 - color1 (red)
  green = '#B4C7A7',    -- base0A - color2 (green)
  blue = '#7EB3C9',     -- base0C - color4 (blue)
  yellow = '#E6C193',   -- base09 - color3 (yellow/orange)
  purple = '#AD8DBD',   -- base0E - color5 (magenta/purple)
  cyan = '#9BC2B1',     -- base0B - mark3_background (teal)
  gray = '#454756',     -- base03 - color8 (bright black)
  gray2 = '#99A3C2',    -- base06 - inactive_border_color
  gray3 = '#D1CEC9',    -- base04 - color7 (white)
  brightblue = '#7BC2DF', -- base0D - color12 (bright blue)
  darkpurple = '#8D6B94', -- base0F - darker purple
  lightblue = '#BDC3E6', -- base07 - lightened periwinkle
}

-- Basic UI
vim.api.nvim_set_hl(0, 'Normal', { fg = c.fg, bg = c.bg })
vim.api.nvim_set_hl(0, 'LineNr', { fg = c.gray2 })
vim.api.nvim_set_hl(0, 'CursorLineNr', { fg = c.fg, bold = true })
vim.api.nvim_set_hl(0, 'Visual', { bg = c.gray })
vim.api.nvim_set_hl(0, 'Search', { fg = c.bg, bg = c.yellow })
vim.api.nvim_set_hl(0, 'StatusLine', { fg = c.fg, bg = c.gray })

-- Syntax highlighting
vim.api.nvim_set_hl(0, 'Comment', { fg = c.gray2, italic = true })
vim.api.nvim_set_hl(0, 'String', { fg = c.green })
vim.api.nvim_set_hl(0, 'Number', { fg = c.red })
vim.api.nvim_set_hl(0, 'Boolean', { fg = c.red })
vim.api.nvim_set_hl(0, 'Function', { fg = c.blue })
vim.api.nvim_set_hl(0, 'Identifier', { fg = c.fg })
vim.api.nvim_set_hl(0, 'Statement', { fg = c.purple, bold = true })
vim.api.nvim_set_hl(0, 'Keyword', { fg = c.purple, bold = true })
vim.api.nvim_set_hl(0, 'Type', { fg = c.yellow })
vim.api.nvim_set_hl(0, 'Operator', { fg = c.cyan })
vim.api.nvim_set_hl(0, 'Special', { fg = c.cyan })
vim.api.nvim_set_hl(0, 'Constant', { fg = c.red })
vim.api.nvim_set_hl(0, 'PreProc', { fg = c.purple })

-- Treesitter highlights (if available)
vim.api.nvim_set_hl(0, '@string', { link = 'String' })
vim.api.nvim_set_hl(0, '@number', { link = 'Number' })
vim.api.nvim_set_hl(0, '@boolean', { link = 'Boolean' })
vim.api.nvim_set_hl(0, '@function', { link = 'Function' })
vim.api.nvim_set_hl(0, '@keyword', { link = 'Keyword' })
vim.api.nvim_set_hl(0, '@type', { link = 'Type' })
vim.api.nvim_set_hl(0, '@variable', { fg = c.fg })
vim.api.nvim_set_hl(0, '@comment', { link = 'Comment' })

print("Aki colorscheme loaded!")
