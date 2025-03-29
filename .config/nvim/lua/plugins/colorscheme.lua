return {
  "Mofiqul/dracula.nvim",
  lazy = false,
  priority = 1000,
  enabled = true,
  config = function()
    require("dracula").setup({
      colors = {
        bg = "#0F0F0F",
        fg = "#F8F8F2",
        selection = "#44475A",
        comment = "#6272A4",
        red = "#FF5555",
        orange = "#FFB86C",
        yellow = "#F1FA8C",
        green = "#50fa7b",
        purple = "#BD93F9",
        cyan = "#8BE9FD",
        pink = "#FF79C6",
        bright_red = "#FF6E6E",
        bright_green = "#69FF94",
        bright_yellow = "#FFFFA5",
        bright_blue = "#D6ACFF",
        bright_magenta = "#FF92DF",
        bright_cyan = "#A4FFFF",
        bright_white = "#FFFFFF",
        menu = "#21222C",
        visual = "#3E4452",
        gutter_fg = "#4B5263",
        nontext = "#3B4048",
        white = "#ABB2BF",
        black = "#191A21",
      },
      overrides = function(colors)
        return {
          BlinkCmpLabel = { fg = colors.white, bg = nil },
          BlinkCmpLabelDeprecated = { fg = colors.white, bg = nil },
          BlinkCmpLabelMatch = { fg = colors.cyan, bg = nil },
          BlinkCmpKind = { fg = colors.white, bg = nil },
        }
      end,
      transparent_bg = true,
      italic_comment = true,
    })

    vim.cmd.colorscheme("dracula")
  end,
}
