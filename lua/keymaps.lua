local m = {}
opts = { noremap = true, silent = true }

m.set_keymap = function(var1, var2)
	vim.keymap.set("n", var1, var2, opts)
end

m.set_i = function(var1,  var2)
	vim.keymap.set("i", var1, var2, opts)
end



vim.g.mapleader = " "

m.set_keymap("<C-h>", "<C-w>h")
m.set_keymap("<C-j>", "<C-w>j")
m.set_keymap("<C-k>", "<C-w>k")
m.set_keymap("<C-l>", "<C-w>l")

m.set_keymap("<S-l>", ":bnext<cr>")
m.set_keymap("<S-h>", ":bprevious<cr>")

m.set_keymap("<leader>o", ":so<cr>")
m.set_keymap("<leader>w", ":silent update!<cr>")
m.set_keymap( "<leader>q", ":q!<cr>")
m.set_keymap("<leader>e", vim.diagnostic.open_float)


return m
