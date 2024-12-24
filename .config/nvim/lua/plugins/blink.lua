return {
  "saghen/blink.cmp",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    completion = {
      keyword = { range = 'full' },
      documentation = {
        auto_show = false,
        auto_show_delay_ms = 500,
      },
      ghost_text = {
        enabled = false,
      },
    },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { "lsp" },
      cmdline = {},
      min_keyword_length = 3,
    },
    signature = {
      enabled = false,
    }
  },
  opts_extend = { "sources.default" },
}
