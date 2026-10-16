require("vim._core.ui2").enable({})

vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

require("keymaps").set_k("<leader>u", ":Undotree<cr>", "Undo tree")
