local set_k = require("keymaps").set_k

vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

require("fzf-lua").setup({
	winopts = { preview = { layout = "vertical", vertical = "down:80%" } },
})

set_k("<leader>fp", ":FzfLua files<cr>")
set_k("<leader>fg", ":FzfLua grep_project<cr>")
set_k("<leader>fh", ":FzfLua help_tags<cr>")
set_k("<leader>fm", ":FzfLua marks<cr>")
set_k("<leader>h", ":FzfLua buffers<cr>")
set_k("<leader>fs", ":FzfLua grep_curbuf<cr>")
