local gitmap = function(lhs, rhs)
	return vim.keymap.set("n", lhs, ":Git " .. rhs, { buffer = true })
end

gitmap("gl", "log --oneline")
gitmap("gL", "log --graph")
gitmap("gc", "commit -v")
gitmap("gf", "fetch --all")
gitmap("gp", "push")
gitmap("gb", "blame")                                   -- blame view
gitmap("ga", "add %")
gitmap("gd", "diff")
vim.keymap.set("n", "q", ":quit<CR>", { buffer = true, silent = true })

