vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
})

require("mason").setup()

vim.lsp.enable("lua_ls")
vim.lsp.enable("svelte")

-- Keybinds --

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		-- require("keymaps").set_k("gdd", ":FzfLua lsp_declartions<cr>")
		require("keymaps").set_k("gd", ":FzfLua lsp_definitions<cr>")
		require("keymaps").set_k("gt", ":FzfLua lsp_typedefs<cr>")
		require("keymaps").set_k("gi", ":FzfLua lsp_implementations<cr>")
		require("keymaps").set_k("grr", ":FzfLua lsp_references<cr>")
		require("keymaps").set_k("<leader>ca", vim.lsp.buf.code_action)
		require("keymaps").set_k("<leader>rn", vim.lsp.buf.rename)
		require("keymaps").set_k("<leader>e", vim.diagnostic.open_float)
		require("keymaps").set_k("<leader>lf", vim.lsp.buf.format)
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		require("conform").format({ bufnr = args.buf })
	end,
})
