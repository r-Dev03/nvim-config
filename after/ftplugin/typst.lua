vim.bo.commentstring = "// %s"
vim.bo.formatprg = "typstfmt 2>/dev/null"
vim.cmd.compiler("typst")
vim.bo.makeprg = "typst compile %:p"
