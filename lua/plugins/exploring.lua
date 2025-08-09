local set_k = require("keymaps").set_k

vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/ibhagwan/fzf-lua",
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "v3.x" },
})

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

require("neo-tree").setup({
	event_handlers = {
		{
			event = "file_opened",
			handler = function()
				require("neo-tree.command").execute({ action = "close" })
			end,
		},
	},
})

set_k("<leader>pv", ":Oil<cr>")

-- FZF Keymaps --
--
set_k("<leader>fp", ":FzfLua files<cr>")
set_k("<leader>fg", ":FzfLua grep_visual<cr>")
set_k("<leader>fh", ":FzfLua help_tags<cr>")
set_k("<leader>fm", ":FzfLua marks<cr>")
set_k("<leader>h", ":FzfLua buffers<cr>")
set_k("<leader>fs", ":FzfLua grep_curbuf<cr>")
