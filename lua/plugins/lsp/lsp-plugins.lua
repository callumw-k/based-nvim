vim.pack.add({
	"https://github.com/pmizio/typescript-tools.nvim",
	"https://github.com/nvim-flutter/flutter-tools.nvim",
	"https://github.com/folke/lazydev.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
})

require("lazydev").setup({
	opts = {
		library = {
			{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
		},
	},
})

require("typescript-tools").setup({})

require("flutter-tools").setup({
	dev_log = {
		enabled = true,
		notify_errors = false,
		focus_on_open = false,
		auto_open = false,
		open_cmd = "10split",
	},
	fvm = true,
	dev_tools = {
		autostart = true,
		auto_open_browser = false,
	},
	lsp = { settings = { lineLength = 120 } },
})

require("telescope").load_extension("flutter")
local builtin = require("telescope").extensions

require("keymaps").set_k("<leader>ft", function()
	builtin.flutter.commands()
end)

require("keymaps").set_k("<leader>fl", ":FlutterLogToggle<cr>")
