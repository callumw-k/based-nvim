vim.pack.add({ 'https://github.com/anuvyklack/windows.nvim', 'https://github.com/anuvyklack/middleclass' })

vim.o.winwidth = 10
vim.o.winminwidth = 10
vim.o.equalalways = false

require('windows').setup()

require('keymaps').set_k("<leader>mp", ":WindowsMaximize<cr>")
