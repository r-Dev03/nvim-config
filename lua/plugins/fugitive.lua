return {
	"tpope/vim-fugitive",
	config = function()
		-- vim.keymap.set("n", "<leader>g", vim.cmd.Git)

		local function toggle_fugitive()
			for _, win in ipairs(vim.api.nvim_list_wins()) do
				local buf = vim.api.nvim_win_get_buf(win)
				if vim.api.nvim_buf_is_loaded(buf) and vim.bo[buf].filetype == "fugitive" then
					vim.api.nvim_win_close(win, true)
					return
				end
			end
			vim.cmd("Git")
		end

		vim.keymap.set("n", "<leader>g", toggle_fugitive, {
			desc = "Toggle Fugitive status window",
			silent = true,
		})
	end,
}
