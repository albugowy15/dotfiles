return {
  {
    "vague2k/vague.nvim",
    priority = 1000,
    config = function()
      require("vague").setup({
        transparent = false,
        bold = true,
        italic = true,
      })
      vim.cmd.colorscheme("vague")
    end,
  },
  -- {
  --   "miikanissi/modus-themes.nvim",
  --   priority = 1000,
  --   config = function()
  --     require("modus-themes").setup({
  --       style = "modus_vivendi",
  --       transparent = false,
  --       dim_inactive = false,
  --       hide_inactive_statusline = true,
  --     })
  --
  --   end,
  -- },
}
