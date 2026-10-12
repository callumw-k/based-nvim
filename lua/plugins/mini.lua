vim.pack.add({
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/nvim-mini/mini.ai",
})

require("mini.surround").setup({
	mappings = {
		add = "gsa",
		delete = "gsd",
		find = "gsf",
		find_left = "gsF",
		highlight = "gsh",
		replace = "gsr",
		update_n_lines = "gsn",
	},
})
require("mini.ai").setup({})
