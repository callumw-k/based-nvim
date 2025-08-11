vim.pack.add({ "https://github.com/greggh/claude-code.nvim" })

require("claude-code").setup({
	keymaps = {
		toggle = {
			normal = "<leader>cl", -- Normal mode keymap for toggling Claude Code, false to disable
			terminal = "<leader>cl", -- Terminal mode keymap for toggling Claude Code, false to disable
			variants = {
				continue = "<leader>cC", -- Normal mode keymap for Claude Code with continue flag
				verbose = "<leader>cV", -- Normal mode keymap for Claude Code with verbose flag
			},
		},
	},
	window = {
		position = "float",
		float = {
			width = "90%", -- Take up 90% of the editor width
			height = "90%", -- Take up 90% of the editor height
			row = "center", -- Center vertically
			col = "center", -- Center horizontally
			relative = "editor",
			border = "double", -- Use double border style
		},
	},
})
