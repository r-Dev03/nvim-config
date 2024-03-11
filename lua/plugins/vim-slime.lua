return {
	"jpalardy/vim-slime",
	event = "VeryLazy",
	config = function()
		-- Set up Slime with tmux as the target
		vim.g.slime_target = "tmux"

		-- Configure default Slime options
		vim.g.slime_default_config = {
			socket_name = vim.fn.split(os.getenv("TMUX"), ",")[1],
			target_pane = ":.2",
		}

		-- Set key mapping for sending text to tmux
		vim.keymap.set("n", "<leader><CR>", "<Plug>SlimeSendCell<cr>", { noremap = true, silent = true })
		vim.keymap.set("v", "<leader><CR>", "<Plug>SlimeRegionSend<cr>", { noremap = true, silent = true })
	end,
}
