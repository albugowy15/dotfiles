return {
  "saghen/blink.cmp",
  -- dependencies = { "fang2hou/blink-copilot" },
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
      -- documentation = { auto_show = false },
      -- ghost_text = { enabled = false },
    },
    sources = {
      -- default = { "lazydev", "lsp", "path", "buffer", "copilot" },
      default = { "lazydev", "lsp", "path", "buffer" },
      providers = {
        lazydev = {
          name = "LazyDev",
          module = "lazydev.integrations.blink",
          -- make lazydev completions top priority (see `:h blink.cmp`)
          score_offset = 100,
        },
        -- copilot = {
        --   name = "copilot",
        --   module = "blink-copilot",
        --   score_offset = 100,
        --   async = true,
        -- },
      },
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
