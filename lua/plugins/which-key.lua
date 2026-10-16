vim.pack.add({ "https://github.com/folke/which-key.nvim" })

local wk = require("which-key")
wk.setup({ preset = "helix" })
wk.add({
	{ "<leader>c", group = "code" },
	{ "<leader>f", group = "find" },
	{ "<leader>g", group = "git" },
	{ "<leader>l", group = "lsp" },
	{ "<leader>m", group = "window" },
	{ "<leader>p", group = "explore" },
	{ "<leader>r", group = "refactor" },
})
