vim.pack.add({
	"https://github.com/nvim-mini/mini.surround",
	"https://github.com/nvim-mini/mini.ai",
	"https://github.com/nvim-mini/mini.tabline",
	"https://github.com/nvim-mini/mini.bufremove",
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
require("mini.tabline").setup({
	format = function(buf_id, label)
		local suffix = vim.bo[buf_id].modified and "● " or ""
		return MiniTabline.default_format(buf_id, label) .. suffix
	end,
})
require("mini.bufremove").setup({})
