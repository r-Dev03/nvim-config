return {
	"nvim-treesitter/nvim-treesitter",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			ensure_installed = {
				"angular",
				"bash",
				"c",
				"go",
				"gitignore",
				"cpp",
				"css",
				"html",
				"hyprlang",
				"javascript",
				"java",
				"lua",
				"markdown",
				"markdown_inline",
				"matlab",
				"nix",
				"python",
				"rust",
				"scss",
				"typescript",
				"dart",
				"toml",
				"tsx",
				"typst",
				"vim",
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
					init_selection = "gnn",
					node_incremental = "grn",
					scope_incremental = "grc",
					node_decremental = "grm",
				},
			},
		})
	end,
}
