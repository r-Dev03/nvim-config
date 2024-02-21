return {
	"vimpostor/vim-tpipeline",
	lazy = false,
	cond = function()
		return vim.env.TMUX ~= nil
	end,
	init = function()
		vim.g.tpipeline_autoembed = 0
		vim.cmd("set laststatus=0")
		vim.g.tpipeline_statusline = ""
	end,
}
