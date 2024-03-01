return {
	"nvim-treesitter/nvim-treesitter",

	config = function()
		local treesitter = require("nvim-treesitter.configs")

		-- See `:help nvim-treesitter-quickstart` or the repo's README
		treesitter.setup({
			ensure_installed = {
				"vimdoc",
				"angular",
				"lua",
				"javascript",
				"typescript",
				"nix",
				"html",
				"scss",
				"css",
				"c",
				"python",
				"bash",
				"java",
				"markdown",
				"markdown_inline",
				"typst",
			},
			ignore_install = {
				"latex", -- using vimtex instead
			},
			auto_install = true,
			highlight = {
				enable = true,
			},
			indent = {
				enable = true,
			},
		})
	end,
}
