vim.g.mapleader = " "
vim.g.maplocalleader = ","

-- `Space + e` will open netrw.
vim.keymap.set("n", "<Leader>e", vim.cmd.Ex)
vim.keymap.set("i", "<C-BS>", "<Esc>cvb", {})

-- Moving a block of code using C/V in visual mode with movement keys
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Let cursor remain at current spot after appending a line using J
vim.keymap.set("n", "J", "mzJ`z")

--Copying things into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>d", [["_dd"]])

--Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set("v", "<leader>p", '"+p', { desc = "Paste from system clipboard" })

--Automatically reselect visual selection after indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

--Middle cursor after half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- S&R -> replace word under cursor across file
vim.keymap.set("n", "<leader>sr", [[:%s/<C-r><C-w>//gl<Left><Left><Left>]])

-- <<< Quickfix list >>>
vim.keymap.set("n", "<leader>qo", ":copen<cr>", { desc = "Open quickfix list" })
vim.keymap.set("n", "<leader>qc", ":cclose<cr>", { desc = "Close quickfix list" })
vim.keymap.set("n", "<leader>qn", ":cn<cr>", { desc = "Next quickfix item" })
vim.keymap.set("n", "<leader>qp", ":cp<cr>", { desc = "Prev quickfix item" })



vim.keymap.set('c', '<c-h>', '<left>')
vim.keymap.set('c', '<c-j>', '<down>')
vim.keymap.set('c', '<c-k>', '<up>')
vim.keymap.set('c', '<c-l>', '<right>')


