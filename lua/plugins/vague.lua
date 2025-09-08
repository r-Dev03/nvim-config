return {
	"vague2k/vague.nvim",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other plugins
	config = function()
		-- NOTE: you do not need to call setup if you don't want to.
		require("vague").setup({
			transparent = false, -- don't set background
			-- disable bold/italic globally in `style`
			bold = true,
			italic = true,
			style = {
				-- "none" is the same thing as default. But "italic" and "bold" are also valid options
				boolean = "bold",
				number = "none",
				float = "none",
				error = "bold",
				comments = "italic",
				conditionals = "none",
				functions = "none",
				headings = "bold",
				operators = "none",
				strings = "italic",
				variables = "none",

				-- keywords
				keywords = "none",
				keyword_return = "italic",
				keywords_loop = "none",
				keywords_label = "none",
				keywords_exception = "none",

				-- builtin
				builtin_constants = "bold",
				builtin_functions = "none",
				builtin_types = "bold",
				builtin_variables = "none",
			},
			-- plugin styles where applicable
			-- make an issue/pr if you'd like to see more styling options!
			plugins = {
				cmp = {
					match = "bold",
					match_fuzzy = "bold",
				},
				dashboard = {
					footer = "italic",
				},
				lsp = {
					diagnostic_error = "bold",
					diagnostic_hint = "none",
					diagnostic_info = "italic",
					diagnostic_ok = "none",
					diagnostic_warn = "bold",
				},
				neotest = {
					focused = "bold",
					adapter_name = "bold",
				},
				telescope = {
					match = "bold",
				},
			},

			-- Override highlights or add new highlights
			on_highlights = function(highlights, colors) end,

			-- Override colors
			colors = {
				bg = "#101317",
				inactiveBg = "#1c1c24",
				fg = "#D1CEC9",
				floatBorder = "#878787",
				line = "#252530",
				comment = "#505164",
				builtin = "#797EA3",
				func = "#bb9dbd",
				string = "#869983",
				number = "#a8915b",
				property = "#c3c3d5",
				constant = "#8f8fb4",
				parameter = "#b48484",
				visual = "#454756",
				error = "#CA6D73",
				warning = "#E6C193",
				hint = "#99A3C2",
				operator = "#90a0b5",
				keyword = "#797ea3",
				type = "#9bb4bc",
				search = "#334156",
				plus = "#B4C7A7",
				delta = "#E6C193",
			},
		})
		vim.cmd("colorscheme vague")
		vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#99A3C2", bg = "NONE", bold = true })
		vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "#101317", fg = "#D1CEC9" })
	end,
}
