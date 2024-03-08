return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
		"saadparwaiz1/cmp_luasnip",
		{
			"L3MON4D3/LuaSnip",
			build = "make install_jsregexp",
		},
},

	config = function()
		local cmp = require("cmp")
		local kind_icons = {
			Text = "󰉿",
			Method = "󰆧",
			Function = "",
			Constructor = "",
			Field = "󰇽",
			Variable = "󰫧",
			Class = "󰠱",
			Interface = "",
			Module = "",
			Property = "",
			Unit = "",
			Value = "󰎠",
			Enum = "",
			Keyword = "󰌋",
			Snippet = "",
			Color = "󰏘",
			File = "󰈙",
			Reference = "",
			Folder = "󰉋",
			EnumMember = "",
			Constant = "󰏿",
			Struct = "",
			Event = "",
			Operator = "󰆕",
			TypeParameter = "󰅲",
			Copilot = "󱁉",
		}
		vim.opt.completeopt = { "menu", "menuone", "noselect" }

		cmp.setup({
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
				end,
			},
			-- Radium cmp settings
			-- window = {
			-- 	documentation = { border = "single" },
			-- 	completion = {
			-- 		border = "single",
			-- 		completeopt = "menu,menuone,noinsert",
			-- 		col_offset = 0,
			-- 		side_padding = 1,
			-- 		keyword_length = 1,
			-- 	},
			-- },
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert({
				["<C-j>"] = cmp.mapping({
					i = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
					c = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
				}),
				["<C-k>"] = cmp.mapping({
					i = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
					c = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
				}),
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-e>"] = cmp.mapping.abort(),
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "nvim_lua" },
				{ name = "luasnip" }, -- For luasnip users.
				-- { name = "orgmode" },
			}, {
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
				format = function(_, vim_item)
					vim_item.kind = kind_icons[vim_item.kind]
					-- Uncomment to see which sources provide each completion (useful for debugging)
					-- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
					-- vim_item.menu = entry.source.name
					return vim_item
				end,
			},
		})

		cmp.setup.cmdline(":", {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = "path" },
			}, {
				{ name = "cmdline" },
			}),
		})
	end,
}
