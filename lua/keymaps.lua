local m = {}
opts = { noremap = true, silent = true }

m.set_k = function(var1, var2)
	vim.keymap.set("n", var1, var2, opts)
end

m.set_i = function(var1,  var2)
	vim.keymap.set("i", var1, var2, opts)
end



vim.g.mapleader = " "

m.set_k("<C-h>", "<C-w>h")
m.set_k("<C-j>", "<C-w>j")
m.set_k("<C-k>", "<C-w>k")
m.set_k("<C-l>", "<C-w>l")

m.set_k("<S-l>", ":bnext<cr>")
m.set_k("<S-h>", ":bprevious<cr>")

m.set_k("<leader>o", ":so<cr>")
m.set_k("<leader>w", ":silent update!<cr>")
m.set_k( "<leader>q", ":q!<cr>")
m.set_k("<leader>e", vim.diagnostic.open_float)


return m
