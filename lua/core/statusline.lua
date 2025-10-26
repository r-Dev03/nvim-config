local modes = {
	["n"] = "N",
	["v"] = "V",
	["i"] = "I",
	["R"] = "R",
	["c"] = "C",
	["t"] = "T",
}

local function mode()
	local current_mode = vim.api.nvim_get_mode().mode
	return string.format(" %s ", modes[current_mode] or "N"):upper()
end

local function fileinfo()
	return "%S %m %f [%l:%c] "
end

local function lsp()
	local count = {}
	local levels = {
		errors = "Error",
		warnings = "Warn",
		info = "Info",
		hints = "Hint",
	}

	for k, level in pairs(levels) do
		count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
	end

	local icons = {
		errors = "",
		warnings = "",
		hints = "",
		info = "",
	}

	local result = ""
	for k, icon in pairs(icons) do
		if count[k] ~= 0 then
			result = result .. string.format(" %%#StatuslineAccent#%s %d", icon, count[k])
		end
	end

	return result .. "%#Normal#"
end

local function fugitive_branch()
	local branch = ""
	local ok, head = pcall(vim.fn.FugitiveHead)
	if ok and head and head ~= "" then
		branch = string.format(" %%#StatuslineAccent# %s %%#Normal#", head)
	end
	return branch
end

Statusline = {}

Statusline.active = function()
	return table.concat({
		"%#Statusline#",
		"%#StatuslineAccent#",
		mode(),
		"%#Normal# ",
		"%#Normal#",
		fugitive_branch(),
		lsp(),
		"%=%#StatuslineAccent#",
		fileinfo(),
	})
end

function Statusline.inactive()
	return " %F"
end

function Statusline.short()
	return "%#StatusLineNC#   NvimTree"
end

vim.api.nvim_exec(
	[[
  augroup Statusline
  au!
  au WinEnter,BufEnter * setlocal statusline=%!v:lua.Statusline.active()
  au WinLeave,BufLeave * setlocal statusline=%!v:lua.Statusline.inactive()
  au WinEnter,BufEnter,FileType NvimTree setlocal statusline=%!v:lua.Statusline.short()
  augroup END
]],
	false
)
