return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "*",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      accept = {
        auto_brackets = {
          enabled = false,
        },
      },
      menu = {
        border = "rounded",
      },
      documentation = { auto_show = false },
      ghost_text = { enabled = false },
    },
    sources = {
      default = { "lsp", "path", "buffer" },
    },
    cmdline = {
      enabled = false,
    },
    keymap = {
      preset = "enter",
    },
  },
  opts_extend = { "sources.default" },
}
