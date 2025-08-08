local keymaps = require('keymaps')

vim.cmd[[set completeopt+=menuone,noselect,popup]]

vim.pack.add({
	'https://github.com/neovim/nvim-lspconfig',
	'https://github.com/mason-org/mason.nvim'
})

require("mason").setup()

vim.lsp.enable("lua_ls")


-- Keybinds --

keymaps.set_k("<leader>lf", vim.lsp.buf.format)
