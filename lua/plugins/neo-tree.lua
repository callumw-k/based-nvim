vim.pack.add({
	{ src = "https://github.com/nvim-neo-tree/neo-tree.nvim", version = "v3.x" },
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
