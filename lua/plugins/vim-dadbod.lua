return {
	"kristijanhusak/vim-dadbod-ui",
	dependencies = {
		{ "tpope/vim-dadbod", lazy = true },
		{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true }, -- Optional
	},
	cmd = {
		"DBUI",
	},
	init = function()
		vim.g.db_ui_use_nerd_fonts = 1
		vim.g.db_ui_show_help = 0
		
		vim.api.nvim_create_autocmd("FileType", {
			pattern = "dbout",
			callback = function()
				vim.cmd("resize 30")
				vim.opt_local.wrap = true
				vim.opt_local.linebreak = true
			end,
		})
	end,
}
