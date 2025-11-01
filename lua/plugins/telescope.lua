return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	event = "VeryLazy",

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				dynamic_preview_title = true,
				path_display = { "filename_first" },
				layout_config = {
					width = { padding = 0 },
					height = { padding = 0 },
					horizontal = {
						preview_width = 0.65,
						preview_cutoff = 120,
					},
				},
				prompt_prefix = "   ",
				selection_caret = "󱞩 ",
				entry_prefix = "   ",
				multi_icon = " ",
				mappings = {
					n = {
						q = actions.close,
					},
					i = {
						["<Esc>"] = actions.close,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-s>"] = actions.file_vsplit,
					},
				},

				vimgrep_arguments = {
					"rg",
					"--with-filename",
					"--no-heading",
					"--line-number",
					"--column",
					"--ignore-case",
				},

				file_ignore_patterns = {
					"node_modules",
					"%.direnv/",
					"%.git/",
					".*%.lock/",
				},
			},

			pickers = {
				find_files = {
					prompt_title = "Find Files",
					previewer = false,
					layout_strategy = "center",
					layout_config = {
						width = 0.55,
						height = 0.60,
					},
					borderchars = {
						prompt = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
						results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
					},
					results_title = false,
					sorting_strategy = "ascending",
					path_display = { "filename_first" },
					find_command = {
						"fd",
						"--hidden",
						"--type",
						"f",
						"--exclude",
						".git",
						"--exclude",
						"node_modules",
						"--exclude",
						"target",
						"--exclude",
						"build",
						"--exclude",
						".direnv",
					},
				},

				buffers = {
					sort_lastused = true,
					sort_mru = true,
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer + actions.move_to_top, -- delete + stay in picker
						},
					},
				},
			},
		})
		telescope.load_extension("fzf")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fl", builtin.live_grep, { desc = "[F]ind by [L]ive grep" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Search [G]it [F]iles" })
		vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "[F]ind active [B]uffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind help tags" })
		vim.keymap.set("n", "<leader>fi", ":Telescope highlights <CR>", { desc = "[F]ind highl[I]ghts" })
		vim.keymap.set(
			"n",
			"<leader>f/",
			builtin.current_buffer_fuzzy_find,
			{ desc = "[/] Fuzzily [F]ind in current buffer" }
		)
	end,
}
