local o = vim.opt

o.cmdheight = 1

o.undofile = true
o.undolevels = 1000

o.signcolumn = "yes"
o.smartindent = true
o.tabstop = 2
o.softtabstop = 2
o.shiftwidth = 2

o.number = true
o.relativenumber = true

o.wrap = false

o.swapfile = false

o.splitbelow = true
o.splitright = true
o.winwidth = 90
o.winminwidth = 10
o.termguicolors = true
o.hlsearch = false
o.hidden = true
o.scrolloff = 8
o.expandtab = true
o.incsearch = true
o.ignorecase = true
o.smartcase = true
o.inccommand = "split"
o.winborder = "rounded"
o.exrc = true

vim.api.nvim_create_autocmd("WinEnter", {
	callback = function()
		if vim.api.nvim_win_get_config(0).relative == "" then
			vim.cmd("horizontal wincmd =")
		end
	end,
})
