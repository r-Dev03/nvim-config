return {
	"nvim-treesitter/nvim-treesitter",

	config = function()
		local treesitter = require("nvim-treesitter.configs")

		-- See `:help nvim-treesitter-quickstart` or the repo's README
		treesitter.setup({
			ensure_installed = {
				"angular",
				"bash",
				"c",
				"css",
				"html",
				"javascript",
				"java",
				"lua",
				"markdown",
				"markdown_inline",
				"nix",
				"python",
				"scss",
				"typescript",
				"typst",
				"vimdoc",
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
			autotag = {
				enable = true,
				enable_close_on_slash = false,
			},
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = "gnn", -- set to `false` to disable one of the mappings
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		})
	end,
}
