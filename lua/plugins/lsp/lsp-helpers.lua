vim.pack.add({
  "https://github.com/stevearc/conform.nvim",
  { src = "https://github.com/L3MON4D3/LuaSnip", version = "v2.4.0" },
  { src = "https://github.com/Saghen/blink.cmp", version = "v1.6.0" },
})

require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    rust = { "rustfmt", lsp_format = "fallback" },
    javascript = { "prettierd", stop_after_first = true },
    typescript = { "prettierd", stop_after_first = true },
    svelte = { "prettierd", stop_after_first = true },
    dart = { lsp_format = "fallback" },
    cs = { lsp_format = "fallback" },
    astro = { "prettierd", stop_after_first = true },
  },
  default_format_opts = {
    lsp_format = "fallback",
  },
  format_on_save = {
    timeout_ms = 500,
  },
})

require("blink.cmp").setup({
  keymap = {
    ["<CR>"] = { "accept", "fallback" },
  },
  snippets = { preset = "luasnip" },
  sources = {
    per_filetype = {
      lua = { "lazydev", inherit_defaults = true },
    },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },
  completion = {
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 250,
      treesitter_highlighting = true,
      window = { border = "rounded" },
    },

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
              or vim.fn.getcmdtype() == "@"
        end,
      },
    },
  },
})
