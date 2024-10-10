return {
  -- {
  --   "scottmckendry/cyberdream.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {
  --     transparent = false,
  --     italic_comments = true,
  --     hide_fillchars = false,
  --     borderless_telescope = false,
  --     terminal_colors = true,
  --     theme = {
  --       variant = "dark",
  --     },
  --   },
  -- },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "night",
      light_style = "day",
      transparent = false,
      terminal_colors = true,
      styles = {
        sidebars = "dark",
        floats = "dark",
      },
      lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      ---@param colors ColorScheme
      on_colors = function(colors)
        colors.bg = "#16181a"
        colors.bg_dark = "#1e2124"
        colors.bg_float = "#1e2124"
        colors.bg_highlight = "#3c4048"
        colors.bg_popup = "#1e2124"
        colors.bg_search = "#7b8496"
        colors.bg_sidebar = "#1e2124"
        colors.bg_statusline = "#1e2124"
        colors.fg_gutter = "#3c4048"
        colors.black = "#3c4048"
        colors.border = "#3c4048"
      end,
      cache = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
