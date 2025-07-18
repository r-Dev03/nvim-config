return {
	"crispybaccoon/aki",
	config = function()
		-- require to trigger population of aki_colors table
		require("aki.colors")
		_G.aki_colors = vim.tbl_deep_extend("force", _G.aki_colors, { bg3 = _G.aki_colors.fg2 })
		require("aki").setup({
			transparent_background = false,
			contrast_dark = "medium",
			contrast_light = "medium",
			emphasis = {
				general = { italic = true },
				keyword = { italic = true },
				type = { type = true },
			},
			override_terminal = true,
			style = {
				cursorline = { soft = true, contrast_currentline = false },
				tabline = { reverse = true, color = "seiun" },
				search = { reverse = false, color = "sakaeru" },
				comment = { italic = true },
			},
			overrides = {},
			plugins = true,
		})
		-- General Highlighting Overrides
		vim.api.nvim_set_hl(0, "LspInfoBorder", { link = "Comment" })
		vim.api.nvim_set_hl(0, "LineNr", { link = "Normal" })
		vim.api.nvim_set_hl(0, "LineNrAbove", { link = "Comment" })
		vim.api.nvim_set_hl(0, "LineNrBelow", { link = "Comment" })
		vim.api.nvim_set_hl(0, "@variable.member", { link = "TSField" })
		vim.cmd.colorscheme("aki")
		vim.api.nvim_set_hl(0, "Normal", { bg = "#101317", fg = "#D4D4D5" })
		vim.api.nvim_set_hl(0, "NormalFloat", { link = "Normal" })
		vim.api.nvim_set_hl(0, "FloatBorder", { link = "Comment" })
		vim.api.nvim_set_hl(0, "Visual", { cterm = none, ctermfg = none, ctermbg = 237, bg = "#454756" })
		vim.api.nvim_set_hl(0, "@field", { fg = "#797EA3" })
		vim.api.nvim_set_hl(0, "PmenuSel", { link = "Visual" })
		vim.api.nvim_set_hl(0, "PmenuThumb", { link = "Visual" })
		vim.api.nvim_set_hl(0, "@markup.heading.1.markdown", { link = "@text.title.1.markdown" })
		vim.api.nvim_set_hl(0, "@markup.heading.1.marker.markdown", { link = "@text.title.1.markdown" })
		vim.api.nvim_set_hl(0, "@markup.heading.2.markdown", { link = "@text.title.2.markdown" })
		vim.api.nvim_set_hl(0, "@markup.heading.2.marker.markdown", { link = "@text.title.2.markdown" })
		vim.api.nvim_set_hl(0, "@markup.heading.3.markdown", { link = "@text.title.3.markdown" })
		vim.api.nvim_set_hl(0, "@markup.heading.3.marker.markdown", { link = "@text.title.3.markdown" })
		vim.api.nvim_set_hl(0, "@markup.heading.4.markdown", { link = "@text.title.4.markdown" })
		vim.api.nvim_set_hl(0, "@markup.heading.4.marker.markdown", { link = "@text.title.4.markdown" })
		vim.api.nvim_set_hl(0, "@markup.heading.5.markdown", { link = "@text.title.5.markdown" })
		vim.api.nvim_set_hl(0, "@markup.heading.5.marker.markdown", { link = "@text.title.5.markdown" })
		vim.api.nvim_set_hl(0, "@markup.heading.6.markdown", { link = "@text.title.6.markdown" })
		vim.api.nvim_set_hl(0, "@markup.heading.6.marker.markdown", { link = "@text.title.6.markdown" })


		--Telescope Highlighting Overrides
		vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "Normal" })
		vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "Comment" })
		vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { link = "TelescopePreviewGroup" })
		vim.api.nvim_set_hl(0, "TelescopeMultiIcon", { link = "TelescopeNormal" })
		vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "#B4C7A7", fg = "#101317" })
		vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "#939DBD", fg = "#101317" })
		vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "#CA6D73", fg = "#101317" })
		vim.api.nvim_set_hl(0, "TelescopePromptCounter", { link = "Telescope" })
	end,
}
