return {
  { "nvim-lua/plenary.nvim", lazy = true },
  {
    "vyfor/cord.nvim",
    build = ":Cord update",
    event = "VeryLazy",
  },
  {
    "j-hui/fidget.nvim",
    opts = {
      progress = {
        suppress_on_insert = true,
        ignore_done_already = true,
        ignore_empty_message = true,
        display = {
          render_limit = 5,
        },
      },
    },
  },
  { "nvim-tree/nvim-web-devicons", event = "VeryLazy" },
  {
    "b0o/SchemaStore.nvim",
    lazy = true,
    version = false,
  },
}
