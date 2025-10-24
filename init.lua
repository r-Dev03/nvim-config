-- Load `./lua/core/statusline.lua`
require("core.statusline")
-- Load `./lua/core/options.lua`
require("core.options")
-- Load `./lua/core/lsp.lua`
require("core.lsp")
-- Load `./lua/core/keymaps.lua`
require("core.keymaps")
-- Load `./lua/utils/auto_commands.lua`
require("utils.auto_commands")

-- Default installation path for lazy -- this will resolve to `~/.local/share/nvim`.
local lazy_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

local lazy_setup = function()
	-- Add lazy to neovim's runtime path, this is where neovim looks for files and shit
	-- See `:help rtp`
	vim.opt.runtimepath:prepend(lazy_path)

	-- Read about these options in `:help lazy.nvim-lazy.nvim-configuration` or here:
	-- <https://github.com/folke/lazy.nvim#%EF%B8%8F-configuration>
	--
	-- The first argument (vvvvvvv) tells lazy where to look for plugin configs, and it's relative to
	-- `./lua`
	require("lazy").setup("plugins", {
		defaults = {
			-- Disable lazy loading by default so it doesn't fuck anything up
			lazy = false,
		},

		install = {
			-- Install missing plugins automatically
			missing = true,
		},

		ui = {
			border = "rounded",
		},
	})
end

-- Is lazy already installed?
local lazy_installed = vim.loop.fs_stat(lazy_path)

if lazy_installed then
	lazy_setup()
else
	-- Clone lazy into `lazy_path`
	vim.fn.system({
		"git",
		"clone",
		"--branch=stable",
		"https://github.com/folke/lazy.nvim",
		lazy_path,
	})

	vim.notify("Installed lazy.nvim")
	lazy_setup()
end
