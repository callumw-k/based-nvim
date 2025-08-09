vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/goolord/alpha-nvim",
	"https://github.com/romgrk/barbar.nvim",
	"https://github.com/EdenEast/nightfox.nvim",
	"https://github.com/catppuccin/nvim",
	"https://github.com/anuvyklack/windows.nvim",
	"https://github.com/anuvyklack/middleclass",
})

vim.g.barbar_auto_setup = false

require("lualine").setup()

require("barbar").setup({
	insert_at_end = true,
	animation = false,
})

require("alpha").setup(require("alpha.themes.dashboard").config)

-- Colorscheme --

vim.cmd("colorscheme catppuccin-mocha")

-- Windows --

vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

require("windows").setup()

require("keymaps").set_k("<leader>mp", ":WindowsMaximize<cr>")
