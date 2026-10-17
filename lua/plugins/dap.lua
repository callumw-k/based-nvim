local set_k = require("keymaps").set_k

vim.pack.add({
	"https://github.com/mfussenegger/nvim-dap",
	"https://github.com/igorlfs/nvim-dap-view",
})

require("dap-view").setup({
	auto_toggle = true,
	winbar = { default_section = "scopes" },
	windows = {
		terminal = { hide = { "dart" } },
		anchor = function()
			for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
				if vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(win)):match("__FLUTTER_DEV_LOG__$") then
					return win
				end
			end
		end,
	},
})

local dap = require("dap")

set_k("<F5>", dap.continue)
set_k("<F9>", dap.toggle_breakpoint)
set_k("<F10>", dap.step_over)
set_k("<F11>", dap.step_into)
set_k("<F12>", dap.step_out)
set_k("<leader>V", ":DapViewToggle<cr>")
set_k("<leader>fd", function()
	local fzf = require("fzf-lua")
	fzf.commands({ query = "Dap", actions = { enter = fzf.actions.ex_run_cr } })
end)
