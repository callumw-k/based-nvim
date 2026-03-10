vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd", stop_after_first = true },
		typescript = { "prettierd", stop_after_first = true },
		svelte = { "prettierd", stop_after_first = true },
		dart = { lsp_format = "fallback" },
		cs = { lsp_format = "fallback" },
		astro = { "prettierd", stop_after_first = true },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
	format_on_save = {
		timeout_ms = 500,
	},
})
