vim.pack.add({ "https://github.com/callumw-k/flutter-tools.nvim" })

require("flutter-tools").setup({
	dev_log = {
		enabled = true,
		notify_errors = false,
		focus_on_open = false,
		auto_open = false,
		open_cmd = "botright 15split",
	},
	fvm = true,
	debugger = { enabled = true },
	dev_tools = {
		autostart = true,
		auto_open_browser = false,
	},
	lsp = { settings = { lineLength = 120 } },
})

require("keymaps").set_k("<leader>ft", function()
	local fzf = require("fzf-lua")
	fzf.commands({ query = "Flutter", actions = { enter = fzf.actions.ex_run_cr } })
end)

require("keymaps").set_k("<leader>fl", ":FlutterLogToggle<cr>")
