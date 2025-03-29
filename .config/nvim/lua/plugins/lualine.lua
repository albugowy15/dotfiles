return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      theme = "dracula-nvim",
      -- component_separators = { left = "", right = "" },
      section_separators = "",
      globalstatus = false,
    },
    sections = {
      lualine_c = { { "filename", path = 1 } },
    },
  },
}
