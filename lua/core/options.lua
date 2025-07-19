-- Cursor config
vim.opt.guicursor = ""

-- Indentation settings
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.wrap = false
vim.opt.linebreak = true

--Line numbers and sign column
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"


--Split settings
vim.opt.splitright = true
vim.opt.splitbelow = true


vim.opt.virtualedit = "block"
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.cmdheight = 0


--Rounded borders
vim.opt.winborder = 'rounded'

-- vim.opt.wildoptions = { "fuzzy", "pum" }

vim.filetype.add({
  extension = { typ = "typst" },
})

-- qf list builtin plugins
vim.cmd [[ packadd cfilter ]]
