vim.pack.add({ { src = 'https://github.com/nvim-treesitter/nvim-treesitter', version = "master" } })

require('nvim-treesitter.configs').setup({
	ensure_installed = { 'svelte', 'typescript' },
	highlight = { enable = true }
})
