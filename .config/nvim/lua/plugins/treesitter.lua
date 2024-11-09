return {
  -- {
  --   "tpope/vim-sleuth",
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    keys = {
      { "<c-space>", false },
      { "<bs>", false },
    },
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, { "markdown", "scss", "css" })
        vim.treesitter.language.register("markdown", "mdx")
      end
      return {
        incemental_selection = {
          enable = false,
        },
        textobjects = {
          move = {
            enable = false,
          },
        },
      }
    end,
  },
}
