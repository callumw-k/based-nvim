vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = require("gitsigns")
		local set_k = function(lhs, rhs)
			vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true, buffer = bufnr })
		end

		set_k("]h", function()
			gs.nav_hunk("next")
		end)
		set_k("[h", function()
			gs.nav_hunk("prev")
		end)
		set_k("<leader>gs", gs.stage_hunk)
		set_k("<leader>gr", gs.reset_hunk)
		set_k("<leader>gp", gs.preview_hunk)
		set_k("<leader>gb", gs.blame_line)
	end,
})
