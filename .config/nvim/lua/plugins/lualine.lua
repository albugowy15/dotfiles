return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      section_separators = "",
      globalstatus = false,
    },
    sections = {
      lualine_c = { { "filename", path = 1 } },
    },
  },
}
