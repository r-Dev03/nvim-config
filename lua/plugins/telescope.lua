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
		local themes = require("telescope.themes")
		local builtin = require("telescope.builtin")
		local multigrep = require("utils.multigrep")

		-- Reusable fullscreen Ivy layout
		local ivy = function(options)
			local defaults = themes.get_ivy({
				layout_strategy = "vertical",
				treesitter = true,
				layout_config = {
					height = vim.o.lines,
					width = vim.o.columns,
					preview_height = 0.70,
					prompt_position = "top",
					anchor = "C",
				},
				results_title = false,
				preview_title = false,
				borderchars = {
					prompt = { "─", " ", " ", " ", " ", " ", " ", " " },
					results = { " ", " ", " ", " ", " ", " ", " ", " " },
					preview = { " ", " ", " ", " ", " ", " ", " ", " " },
				},
			})
			return vim.tbl_deep_extend("force", defaults, options or {})
		end

		-- Global setup
		telescope.setup({
			defaults = ivy({
				dynamic_preview_title = true,
				path_display = { "filename_first" },
				prompt_prefix = "   ",
				selection_caret = "󱞩 ",
				entry_prefix = "   ",
				multi_icon = " ",
				mappings = {
					n = { q = actions.close },
					i = {
						["<Esc>"] = actions.close,
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-s>"] = actions.file_vsplit,
					},
				},
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden",
					-- "--fixed-strings",
				},

				file_ignore_patterns = {
					"node_modules",
					"%.git/",
					".*%.lock/",
				},
			}),

			pickers = {
				find_files = {
					find_command = {
						"fd",
						"--hidden",
						"--exclude=*.lock",
						"--exclude=target",
						"-t",
						"f",
					},
				},

				buffers = {
					sort_lastused = true,
					ignore_current_buffer = true,
					mappings = {
						i = { ["<C-d>"] = actions.delete_buffer + actions.move_to_top },
						n = { ["<C-d>"] = actions.delete_buffer },
					},
				},
			},

			extensions = {
				fzf = {
					fuzzy = true, -- false will only do exact matching
					override_generic_sorter = true, -- override the generic sorter
					override_file_sorter = true, -- override the file sorter
					case_mode = "smart_case", -- or "ignore_case" or "respect_case"
				},
			},
		})

		telescope.load_extension("fzf")

		-- Keymaps
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fl", function()
			multigrep()
		end, { desc = "[F]ind by [L]ive grep" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "Search [G]it [F]iles" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind active [B]uffers" })
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind help tags" })
		vim.keymap.set("n", "<leader>fi", builtin.highlights, { desc = "[F]ind highl[I]ghts" })
		vim.keymap.set("n", "<leader>f/", builtin.current_buffer_fuzzy_find, { desc = "[/] Fuzzily [F]ind in buffer" })
	end,
}
