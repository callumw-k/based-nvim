vim.pack.add({ { src = "https://github.com/Saghen/blink.cmp", version = "v1.6.0" } })

require("blink.cmp").setup({
	keymap = {
		["<CR>"] = { "accept", "fallback" },
	},
	snippets = { preset = "luasnip" },
	sources = {
		per_filetype = {
			lua = { "lazydev", inherit_defaults = true },
		},
		providers = {
			lazydev = {
				name = "LazyDev",
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 250,
			treesitter_highlighting = true,
			window = { border = "rounded" },
		},
	},
	cmdline = {
		keymap = {
			preset = "inherit",
			["<Tab>"] = { "accept" },
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
		completion = {
			menu = {
				auto_show = function(ctx)
					return vim.fn.getcmdtype() == ":" or vim.fn.getcmdtype() == "@"
				end,
			},
		},
	},
})
