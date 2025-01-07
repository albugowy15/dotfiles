return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    enabled = true,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require("tokyonight").setup({
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
          colors.bg = "#0F0F0F"
          colors.bg_dark = "#16181a"
          colors.bg_highlight = "#3c4048"
          colors.bg_float = "#16181a"
          colors.bg_popup = "#16181a"
          colors.bg_search = "#7b8496"
          colors.bg_sidebar = "#16181a"
          colors.bg_statusline = "#16181a"
          colors.fg_gutter = "#3c4048"
          colors.black = "#3c4048"
          colors.border = "#3c4048"
        end,
        cache = false,

        on_highlights = function(hl, cl)
          hl.LineNrAbove = { fg = "#7b8496" }
          hl.LineNrBelow = { fg = "#7b8496" }
        end,
      })
      vim.cmd.colorscheme("tokyonight")
    end,
  },
}
