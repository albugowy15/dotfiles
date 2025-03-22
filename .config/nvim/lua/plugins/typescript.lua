return {
  "pmizio/typescript-tools.nvim",
  dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  enabled = false,
  opts = {
    expose_as_code_action = "all",
    tsserver_plugins = {
      "@astrojs/ts-plugin",
      "typescript-svelte-plugin",
    },
    include_completions_with_insert_text = false,
  },
}
