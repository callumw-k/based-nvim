vim.pack.add({ { src = "https://github.com/Saghen/blink.cmp", version = "v1.6.0" } })

require("blink.cmp").setup({
	keymap = {
		["<CR>"] = { "accept", "fallback" },
	},
	cmdline = {
		keymap = {
			preset = "inherit",
			["<Tab>"] = { "accept" },
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
		completion = {
			menu = {
				auto_show = function(ctx)
					return vim.fn.getcmdtype() == ":"
					-- enable for inputs as well, with:
					-- or vim.fn.getcmdtype() == '@'
				end,
			},
		},
		-- completion = {
		-- 	menu = {
		-- 		auto_show = function(ctx, _)
		-- 			return ctx.mode == "cmdwin"
		-- 		end,
		-- 	},
		-- },
	},
	-- sources = {
	-- 	providers = {
	-- 		cmdline = {
	-- 			min_keyword_length = function(ctx)
	-- 				-- when typing a command, only show when the keyword is 3 characters or longer
	-- 				if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
	-- 					return 3
	-- 				end
	-- 				return 0
	-- 			end,
	-- 		},
	-- 	},
	-- },
})
-- list = {
-- 	selection = {
-- 		preselect = false,
-- 		auto_insert = false,
-- 	},
-- },
