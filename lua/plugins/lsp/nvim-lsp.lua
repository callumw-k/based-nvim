vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/mason-org/mason-lspconfig.nvim",
})

require("mason").setup({
	registries = {
		"github:mason-org/mason-registry",
		"github:Crashdummyy/mason-registry",
	},
})

require("mason-lspconfig").setup()

vim.lsp.config("ts_ls", {
	settings = {
		completions = { completeFunctionCalls = true },
	},
})

-- vim.lsp.enable("lua_ls")
-- vim.lsp.enable("svelte")
-- vim.lsp.enable("html")
-- vim.lsp.enable("astro")
-- vim.lsp.enable("tailwindcss")
-- vim.lsp.enable("cssls")
-- vim.lsp.enable("eslint")

-- Keybinds --
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local set_k = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true, buffer = ev.buf, desc = desc })
		end

		-- require("keymaps").set_k("gdd", ":FzfLua lsp_declartions<cr>")
		set_k("gd", ":FzfLua lsp_definitions<cr>", "Go to definition")
		set_k("gs", function()
			local fzf = require("fzf-lua")
			fzf.lsp_definitions({ jump1_action = fzf.actions.file_vsplit })
		end, "Go to definition in vsplit")
		set_k("gt", ":FzfLua lsp_typedefs<cr>", "Go to type definition")
		set_k("gi", ":FzfLua lsp_implementations<cr>", "Go to implementation")
		set_k("grr", ":FzfLua lsp_references<cr>", "References")
		set_k("<leader>ca", vim.lsp.buf.code_action, "Code action")
		set_k("<leader>rn", vim.lsp.buf.rename, "Rename symbol")
		set_k("<leader>e", vim.diagnostic.open_float, "Line diagnostics")
		set_k("<leader>lf", function()
			require("conform").format()
		end, "Format buffer")
	end,
})
