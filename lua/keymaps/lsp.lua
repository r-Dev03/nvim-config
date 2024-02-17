local M = {}
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
vim.keymap.set("n", "<leader>ut", function()
	local toggler = require('utils.lsp_toggler')
	local tailwind_id = toggler.get_lsp_num("tailwindcss")
	if (tailwind_id == 0) then
		toggler.start_server("tailwindcss")
		vim.notify("Tailwind LSP started", "info", { id  = tailwind_id })
	else
		toggler.stop_server(tailwind_id)
		vim.notify("Tailwind LSP stopped", "info", { id  = tailwind_id })
	end
end, { desc = "Toggle Tailwind LSP Active / Inactive" })
return M
