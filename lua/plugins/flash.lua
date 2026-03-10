vim.pack.add({ "https://github.com/folke/flash.nvim" })

require("keymaps").set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end)
