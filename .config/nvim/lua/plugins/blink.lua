return {
  "saghen/blink.cmp",
  version = "*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    appearance = {
      nerd_font_variant = "normal",
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = false,
        },
      },
      documentation = { auto_show = false },
      ghost_text = { enabled = false },
    },
    sources = {
      default = { "lazydev", "lsp", "path" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
    cmdline = {
      enabled = false,
    },
    keymap = {
      preset = "enter",
      ["<C-y>"] = { "select_and_accept" },
    },
    signature = { enabled = false },
    fuzzy = { implementation = "rust" },
  },
}
