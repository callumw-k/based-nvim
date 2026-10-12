vim.pack.add({ { src = "https://github.com/Saghen/blink.cmp", version = "v1.10.2" } })

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
		menu = {
			draw = {
				components = {
					label = {
						text = function(ctx)
							local text = ctx.label .. ctx.label_detail
							if ctx.label_detail == "" and (ctx.kind == "Function" or ctx.kind == "Method") then
								text = text .. "()"
							end
							return text
						end,
					},
				},
			},
		},
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
