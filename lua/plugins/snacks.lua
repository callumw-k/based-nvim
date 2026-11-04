local set_k = require("keymaps").set_k

vim.pack.add({ "https://github.com/folke/snacks.nvim" })

require("snacks").setup({
	picker = {
		sources = {
			explorer = {
				focus = "input",
				matcher = { fuzzy = true },
				win = {
					input = {
						keys = {
							["<a-a>"] = { "explorer_add", mode = { "n", "i" } },
							["<a-d>"] = { "explorer_del", mode = { "n", "i" } },
							["<a-r>"] = { "explorer_rename", mode = { "n", "i" } },
							["<a-c>"] = { "explorer_copy", mode = { "n", "i" } },
							["<a-v>"] = { "explorer_move", mode = { "n", "i" } },
						},
					},
				},
			},
		},
	},
})

set_k("<leader>pe", function()
	Snacks.explorer()
end, "Explorer (fuzzy)")
