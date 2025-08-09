vim.pack.add({
	"https://github.com/ibhagwan/fzf-lua",
})

local opts = require("keymaps").set_k

opts("<leader>fp", ":FzfLua files<cr>")
opts("<leader>fg", ":FzfLua grep_visual<cr>")
opts("<leader>fh", ":FzfLua help_tags<cr>")
opts("<leader>fm", ":FzfLua marks<cr>")
opts("<leader>h", ":FzfLua buffers<cr>")
