vim.bo.tabstop = 2
vim.bo.shiftwidth = 2

vim.cmd.compiler("gcc")
vim.bo.makeprg = "gcc -Wall -Werror -O2 -o %< %"
