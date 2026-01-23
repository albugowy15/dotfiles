return {
  "epwalsh/obsidian.nvim",
  version = "*",
  lazy = true,
  ft = "markdown",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  enabled = false,
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/notes/personal",
      },
      {
        name = "work",
        path = "~/notes/work",
      },
    },
  },
}
