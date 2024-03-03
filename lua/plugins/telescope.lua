-- Read `:help lazy.nvim-lazy.nvim-plugin-spec` or
-- <https://github.com/folke/lazy.nvim#-plugin-spec>
return {
	"nvim-telescope/telescope.nvim",

	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
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
				prompt_prefix = "  ",
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
			require("telescope").load_extension("undo")
		})
		vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "NormalFloat" })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "TelescopeNormal" })
		vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { link = "TelescopePreviewGroup" })
		vim.api.nvim_set_hl(0, "TelescopeMultiIcon", { link = "TelescopeNormal" })

		-- See `:help telescope.builtin`
		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
		vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
		vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
		vim.keymap.set("n", "<leader>sb", ":Telescope buffers<CR>", { desc = "Search for active buffers" })
		vim.keymap.set("n", "<leader>su", "<cmd>Telescope undo<cr>")
  	vim.keymap.set("n", "<leader>sh", ":Telescope help_tags<CR>", { desc = "Search for help tags" })
  	vim.keymap.set("n", "<leader>sd", ":Telescope find_files find_command=find,-type,d,!,-name,'node_modules'<cr>", { desc = "Search for directories"})
		vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })
	end,
}
