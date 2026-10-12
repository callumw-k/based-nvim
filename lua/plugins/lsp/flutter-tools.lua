vim.pack.add({ "https://github.com/nvim-flutter/flutter-tools.nvim" })

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

require("keymaps").set_k("<leader>ft", function()
	require("fzf-lua").commands({ query = "Flutter" })
end)

require("keymaps").set_k("<leader>fl", ":FlutterLogToggle<cr>")
