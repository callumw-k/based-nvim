vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
	{ src = "https://github.com/Saghen/blink.cmp", version = "v1.6.0" },
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd", stop_after_first = true },
		typescript = { "prettierd", stop_after_first = true },
		svelte = { "prettierd", stop_after_first = true },
		dart = { lsp_format = "fallback" },
	},
})

require("blink.cmp").setup({
	keymap = {
		["<CR>"] = { "accept", "fallback" },
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
					return vim.fn.getcmdtype() == ":"
						-- enable for inputs as well, with:
						or vim.fn.getcmdtype() == "@"
				end,
			},
		},
	},
})
