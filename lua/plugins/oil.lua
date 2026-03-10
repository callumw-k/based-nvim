local set_k = require("keymaps").set_k

vim.pack.add({ "https://github.com/stevearc/oil.nvim" })

require("oil").setup({
	default_file_explorer = true,
	use_default_keymaps = false,
	keymaps = {
		["g?"] = "actions.show_help",
		["<C-v>"] = {
			"actions.select",
			opts = { vertical = true, close = true },
			desc = "Open the entry in a vertical split",
		},
		["<cr>"] = "actions.select",
		["-"] = "actions.parent",
		["<leader>p"] = {
			"actions.select",
			opts = { tab = true, close = true },
			desc = "Open the entry in new tab",
		},
		["<C-p>"] = "actions.preview",
		["q"] = "actions.close",
		["<C-w>"] = "actions.close",
		["<C-r>"] = "actions.refresh",
		["_"] = "actions.open_cwd",
		["`"] = "actions.cd",
		["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory", mode = "n" },
		["gs"] = "actions.change_sort",
		["gx"] = "actions.open_external",
		["g."] = "actions.toggle_hidden",
		["g\\"] = "actions.toggle_trash",
	},
})

set_k("<leader>pv", ":Oil<cr>")
