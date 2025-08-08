vim.pack.add({ "https://github.com/romgrk/barbar.nvim" })

vim.g.barbar_auto_setup = false

require("barbar").setup({
	insert_at_end = true,
})
