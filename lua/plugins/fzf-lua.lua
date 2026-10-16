local set_k = require("keymaps").set_k

vim.pack.add({ "https://github.com/ibhagwan/fzf-lua" })

require("fzf-lua").setup({
	winopts = { preview = { layout = "vertical", vertical = "down:80%" } },
	fzf_opts = { ["-i"] = true },
	lsp = { code_actions = { previewer = false } },
	grep = {
		rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=4096 "
			.. [[-g "!docs/superpowers/**" -e]],
	},
})
require("fzf-lua").register_ui_select({ winopts = { height = 0.4, width = 0.4 } })

set_k("<leader>fp", ":FzfLua files<cr>", "Find files")
set_k("<leader>fg", ":FzfLua live_grep_native<cr>", "Live grep")
set_k("<leader>fh", ":FzfLua buffers<cr>", "Buffers")
set_k("<leader>fm", ":FzfLua marks<cr>", "Marks")
set_k("<leader>fs", ":FzfLua grep_curbuf<cr>", "Search current buffer")

return {
	command_picker = function(prefix, pinned)
		local rank = {}
		for i, name in ipairs(pinned or {}) do
			rank[name] = i
		end
		local names = {}
		for name in pairs(vim.api.nvim_get_commands({})) do
			if vim.startswith(name, prefix) then
				table.insert(names, name:sub(#prefix + 1))
			end
		end
		table.sort(names, function(a, b)
			local ra, rb = rank[a] or math.huge, rank[b] or math.huge
			if ra ~= rb then
				return ra < rb
			end
			return a < b
		end)
		require("fzf-lua").fzf_exec(names, {
			prompt = prefix .. "> ",
			winopts = { title = " " .. prefix .. " ", height = 0.4, width = 0.4 },
			actions = {
				enter = function(selected)
					vim.cmd(prefix .. selected[1])
				end,
			},
		})
	end,
}
