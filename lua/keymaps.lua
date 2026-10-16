local m = {}
local opts = { noremap = true, silent = true }

m.set = function(var1, var2, var3, desc)
	vim.keymap.set(var1, var2, var3, vim.tbl_extend("force", opts, { desc = desc }))
end

m.set_k = function(var1, var2, desc)
	m.set("n", var1, var2, desc)
end

m.set_i = function(var1, var2, desc)
	m.set("i", var1, var2, desc)
end

vim.g.mapleader = " "

m.set_k("<C-h>", "<C-w>h", "Window left")
m.set_k("<C-j>", "<C-w>j", "Window down")
m.set_k("<C-k>", "<C-w>k", "Window up")
m.set_k("<C-l>", "<C-w>l", "Window right")
m.set_k("<leader>mp", function()
	if vim.t.zoomed then
		vim.cmd.tabclose()
	else
		vim.cmd("tab split")
		vim.t.zoomed = true
	end
end, "Toggle zoom")

m.set_k("<S-l>", ":bnext<cr>", "Next buffer")
m.set_k("<S-h>", ":bprevious<cr>", "Previous buffer")
m.set_k("<leader>b", "<C-^>", "Alternate buffer")

m.set_k("<leader>o", ":so<cr>", "Source file")
m.set_k("<leader>w", ":silent update!<cr>", "Save")
m.set_k("<leader>q", ":q!<cr>", "Quit without saving")
m.set_k("<leader>d", function()
	require("mini.bufremove").delete(0, true)
end, "Delete buffer")
m.set_k("<leader>x", "<C-w>c", "Close window")
m.set_k("<leader>O", ":Bufonly<cr>", "Close other buffers")
m.set_k("<leader>D", ":%bd<cr>", "Delete all buffers")
m.set({ "n", "v", "x" }, "<leader>y", '"+y', "Yank to clipboard")
m.set("x", "p", "P", "Paste without yanking")

return m
