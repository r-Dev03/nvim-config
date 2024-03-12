-- Set all your neovim options here, you can read about them in
-- `:help options-list`
-- as well as see / change your current values interactively with
-- `:options`
--
-- Just put whatever you want here, I recommend you either look through `:help options-list`,
-- kickstart's options, or other people's dotfiles.
--
-- Cursor config
vim.opt.guicursor = ""

-- e.g. indentation settings, because we love tabs... right??
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.wrap = false
vim.opt.linebreak = true

-- You can read about any of these via `:help '<option>'`, e.g. `:help 'number'`
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true

vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.virtualedit = "block"

vim.opt.undofile = true
vim.opt.cmdheight = 0

