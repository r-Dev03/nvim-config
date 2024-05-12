return { {
  'ThePrimeagen/harpoon',
	priority = 52,
  config = function()

		for pos = 0, 9 do
			vim.keymap.set("n", "<leader>h" .. pos, function()
				require("harpoon.ui").nav_file(pos)
			end, { desc = "Move to harpoon mark #" .. pos })
		end

	local mark = require("harpoon.mark")
	local ui = require("harpoon.ui")
		require("harpoon").setup({
			menu = {
				width = 80,
			},

    vim.keymap.set("n", "<leader>ha", mark.add_file),
    vim.keymap.set("n", "<leader>ht", ui.toggle_quick_menu),

		})
  end
} }
