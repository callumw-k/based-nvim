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

require("keymaps").set_k("<leader>j", function()
	require("plugins.fzf-lua").command_picker("Flutter", { "LogToggle" })
end, "Flutter commands")
