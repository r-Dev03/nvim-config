return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"debugloop/telescope-undo.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	event = "VeryLazy",

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local builtin = require("telescope.builtin")

		telescope.setup({
			defaults = {
				vimgrep_arguments = {
					'rg',
					'--with-filename',
					'--no-heading',
					'--line-number',
					'--column',
					'--ignore-case',
					'--hidden',
				},
				file_ignore_patterns = {
					"%node_modules/",
					"%dist/",
					"%assets/",
					"%.git/",
					"%.direnv/",
					"%.png",
					"%.jpg",
					"%.jpeg",
					"%.svg",
					"%.ttf",
					"%.otf",
					"%.lock",
					"%-lock.json",
				},
				path_display = { truncate = 2 },
				prompt_prefix = "   ",
				selection_caret = "  ",
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
				layout_config = {
					horizontal = { width = 0.9, preview_width = 0.7 },
				},
			},
		})
		telescope.load_extension("undo")
		telescope.load_extension("fzf")

		vim.keymap.set("n", "<leader>ff", function()
			builtin.find_files({ hidden = true })
		end, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>lg", builtin.live_grep, { desc = "[L]ive [G]rep" })
		vim.keymap.set("n", "<leader>gf", builtin.git_files, { desc = "Search [G]it [F]iles" })
		vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { desc = "[F]ind active [B]uffers" })
		vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>", { desc = "[F]ind [U]ndo history" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind help tags" })
		vim.keymap.set("n", "<leader>fd", ":Telescope find_files find_command=find,-type,d,!,-name,'node_modules'<cr>", { desc = "[F]ind [D]irectories" })
		vim.keymap.set("n", "<leader>fl", ":Telescope highlights <CR>", { desc = "[F]ind high[L]ights" })
		vim.keymap.set("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "[/] Fuzzily [F]ind in current buffer" })
	end,
}
