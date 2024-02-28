-- Read `:help lazy.nvim-lazy.nvim-plugin-spec` or
-- <https://github.com/folke/lazy.nvim#-plugin-spec>
return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				file_ignore_patterns = {
					"^node_modules/",
					"^dist/",
					"^.git/",
					"^.direnv/",
					"^.sqlx/",
					"^zsh/plugins/",
					"^desktop/icons/",
					"%.png",
					"%.jpg",
					"%.jpeg",
					"%.svg",
					"%.ttf",
					"%.otf",
					"%.lock",
					"%-lock.json",
					"%.wasm",
					"%.xml",
					"%.tmTheme",
				},
				path_display = { truncate = 2 },
				prompt_prefix = "  ",
				selection_caret = "  ",
				entry_prefix = "   ",
				multi_icon = " ",
				mappings = {
					n = {
						q = actions.close
					},
					i = {
						["<Esc>"] = actions.close,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-s>"] = actions.file_vsplit,
					},
				},
				layout_config = {
					horizontal = { width = 0.9, preview_width = 0.7 }
				},
			},
		})

		-- See `:help telescope.builtin`
		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
		vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
		vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
		vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
	end,
}
