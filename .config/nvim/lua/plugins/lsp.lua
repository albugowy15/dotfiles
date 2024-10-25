return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "deno" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = { enabled = false },
      document_highlight = {
        enabled = false,
      },
    },
  },
}
