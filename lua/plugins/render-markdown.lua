vim.pack.add({ "https://github.com/MeanderingProgrammer/render-markdown.nvim" })

require("render-markdown").setup({})

require("keymaps").set_k("<leader>v", function()
	require("render-markdown").toggle()
end, "Toggle Markdown render")
