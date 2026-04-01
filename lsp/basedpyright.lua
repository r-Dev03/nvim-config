return {
	cmd = { "basedpyright-langserver", "--stdio" },
	init_options = {},
	filetypes = {
		"python",
	},
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		".git",
	},
	single_file_support = true,
	settings = {
		basedpyright = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
			},
		},
	},
}
