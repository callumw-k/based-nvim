vim.pack.add({
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/chentoast/marks.nvim",
	"https://github.com/folke/flash.nvim",
})

require("nvim-autopairs").setup({})
require("nvim-ts-autotag").setup({})
require("marks").setup({})

require("keymaps").set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end)
