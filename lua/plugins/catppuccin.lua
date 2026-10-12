vim.pack.add({ "https://github.com/catppuccin/nvim" })

require("catppuccin").setup({
	custom_highlights = function(C)
		return {
			MiniTablineFill = { bg = C.crust },
			MiniTablineCurrent = { fg = C.text, bg = C.base, style = { "bold" } },
			MiniTablineVisible = { fg = C.subtext1, bg = C.mantle },
			MiniTablineHidden = { fg = C.overlay1, bg = C.mantle },
			MiniTablineModifiedCurrent = { fg = C.peach, bg = C.base, style = { "bold" } },
			MiniTablineModifiedVisible = { fg = C.peach, bg = C.mantle },
			MiniTablineModifiedHidden = { fg = C.peach, bg = C.mantle },
			MiniTablineTabpagesection = { fg = C.crust, bg = C.blue, style = { "bold" } },
			MiniTablineTrunc = { fg = C.overlay1, bg = C.crust },
		}
	end,
})

vim.cmd("colorscheme catppuccin-macchiato")
