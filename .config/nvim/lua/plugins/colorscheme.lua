return {
  -- {
  --   "vague2k/vague.nvim",
  --   priority = 1000,
  --   enabled = false,
  --   config = function()
  --     require("vague").setup({
  --       transparent = false,
  --     })
  --   end,
  -- },
  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    config = function()
      require("modus-themes").setup({
        style = "modus_vivendi",
        transparent = false,
        dim_inactive = true,
        hide_inactive_statusline = true,
      })

      vim.cmd.colorscheme("modus_vivendi")
    end,
  },
}
