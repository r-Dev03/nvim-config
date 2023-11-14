-- Read `:help lazy.nvim-lazy.nvim-plugin-spec` or
-- <https://github.com/folke/lazy.nvim#-plugin-spec>
return {
	"nvim-telescope/telescope.nvim",

	dependencies = 
		{ "nvim-lua/plenary.nvim" },

	config = function()
		local telescope = require("telescope")
		local builtin = require("telescope.builtin")

		telescope.setup({})

		-- See `:help telescope.builtin`
		vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
		vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
		vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
		vim.keymap.set('n', '<leader>/', builtin.current_buffer_fuzzy_find, { desc = '[/] Fuzzily search in current buffer' })

	end,
}
