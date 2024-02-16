vim.cmd.compiler("gcc")
vim.bo.makeprg = "gcc -Wall -Werror -O2 -o %< %"
