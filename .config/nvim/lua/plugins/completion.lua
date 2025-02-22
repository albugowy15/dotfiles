return {
  "saghen/blink.cmp",
  -- use a release tag to download pre-built binaries
  event = { "BufReadPost", "BufNewFile" },
  version = "*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    appearance = {
      use_nvim_cmp_as_default = false,
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
      default = { "lsp", "path" },
      -- cmdline = {},
    },
    cmdline = {
      enabled = false,
    },
    keymap = {
      preset = "enter",
      ["<C-y>"] = { "select_and_accept" },
    },
    signature = { enabled = false },
  },
}
