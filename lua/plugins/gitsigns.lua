vim.pack.add({ "https://github.com/lewis6991/gitsigns.nvim" })

require("gitsigns").setup({
	on_attach = function(bufnr)
		local gs = require("gitsigns")
		local set_k = function(lhs, rhs, desc)
			vim.keymap.set("n", lhs, rhs, { noremap = true, silent = true, buffer = bufnr, desc = desc })
		end

		set_k("]h", function()
			gs.nav_hunk("next")
		end, "Next hunk")
		set_k("[h", function()
			gs.nav_hunk("prev")
		end, "Previous hunk")
		set_k("<leader>gs", gs.stage_hunk, "Stage hunk")
		set_k("<leader>gr", gs.reset_hunk, "Reset hunk")
		set_k("<leader>gp", gs.preview_hunk, "Preview hunk")
		set_k("<leader>gb", gs.blame_line, "Blame line")
	end,
})
