return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	event = "VeryLazy",

	config = function()
		local fzf = require("fzf-lua")

		fzf.setup({
			-- Fullscreen Ivy-like layout
			winopts = {
				height = 1.0,
				width = 1.0,
				row = 0.5,
				col = 0.5,
				border = "none", -- no outer borders
				fullscreen = true,
				preview = {
					layout = "vertical",
					vertical = "up:70%",
					horizontal = "right:60%",
					title = false,
					scrollbar = false,
					border = { "─", " ", " ", " ", " ", " ", " ", " " }, -- only top line drawn
				},
			},

			-- Match Telescope’s general layout style
			fzf_opts = {
				["--layout"] = "reverse", -- prompt on top
				["--info"] = "inline",
				["--ansi"] = "",
				["--no-separator"] = "",
			},

			-- Telescope-like keymaps
			keymap = {
				builtin = {
					["<C-d>"] = "preview-page-down",
					["<C-u>"] = "preview-page-up",
					["<Esc>"] = "abort",
					["<C-j>"] = "down",
					["<C-k>"] = "up",
					["<C-s>"] = "vsplit",
				},
			},

			files = {
				prompt = "   ",
				fd_opts = [[--color=never --type f --hidden --follow --exclude .git --exclude node_modules --exclude '*.lock' --exclude target]],
				git_icons = true,
				file_icons = true,
				color_icons = true,
			},

			grep = {
				prompt = "   ",
				-- rely on sane built-in defaults for rg
				-- it automatically uses ripgrep if available
			},

			buffers = {
				prompt = "   ",
				sort_lastused = true,
				ignore_current_buffer = true,
				cwd_only = false,
				actions = {
					["default"] = fzf.actions.file_edit,
					["ctrl-d"] = { fn = fzf.actions.buf_del, desc = "Delete Buffer" },
				},
			},

			previewers = {
				bat = {
					theme = "OneHalfDark",
					config = { "--style=numbers,changes", "--color=always" },
				},
			},

			profile = "telescope",
		})

		-- Keymaps (identical to your Telescope setup)
		vim.keymap.set("n", "<leader>ff", fzf.files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fg", fzf.git_files, { desc = "Search [G]it [F]iles" })
		vim.keymap.set("n", "<leader>fl", fzf.live_grep, { desc = "[F]ind by [L]ive grep" })
		vim.keymap.set("n", "<leader>fb", fzf.buffers, { desc = "[F]ind active [B]uffers" })
		vim.keymap.set("n", "<leader>fh", fzf.help_tags, { desc = "[F]ind help tags" })
		vim.keymap.set("n", "<leader>fo", fzf.oldfiles, { desc = "[F]ind [O]ld files" })
		vim.keymap.set("n", "<leader>f/", fzf.grep_curbuf, { desc = "[/] Fuzzily [F]ind in buffer" })
	end,
}
