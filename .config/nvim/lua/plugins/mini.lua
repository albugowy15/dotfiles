return {
  {
    "echasnovski/mini.statusline",
    version = "*",
    event = "VeryLazy",
    opts = {},
  },
  { "echasnovski/mini-git", version = "*", main = "mini.git", opts = {} },
  {
    "echasnovski/mini.diff",
    version = "*",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = {
      view = {
        style = "sign",
      },
    },
  },
}
