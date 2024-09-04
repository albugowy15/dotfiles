return {
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      transparent = false,
      italic_comments = true,
      hide_fillchars = false,
      borderless_telescope = false,
      terminal_colors = true,
      cache = true, -- generate cache with :CyberdreamBuildCache and clear with :CyberdreamClearCache

      theme = {
        variant = "dark",
      },
    },
  },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   priority = 1000,
  --   config = true,
  --   opts = {
  --     contrast = "hard",
  --     palette_overrides = {
  --       dark0_hard = "#0e0c12",
  --     },
  --   },
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  },
}
