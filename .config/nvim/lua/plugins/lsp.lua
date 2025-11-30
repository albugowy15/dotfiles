return {
  {
    "mason-org/mason.nvim",
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
      "neovim/nvim-lspconfig",
    },
    opts = {
      automatic_enable = false,
      ensure_installed = {
        "bashls",
        "eslint",
        "jsonls",
        "lua_ls",
        "yamlls",
        "tsgo",
      },
    },
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    cmd = "LazyDev",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "lazy.nvim", words = { "LazyVim" } },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "pmizio/typescript-tools.nvim",
    enabled = true,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      single_file_support = false,
      settings = {
        separate_diagnostic_server = false,
        publish_diagnostic_on = "insert_leave",
        expose_as_code_action = { "add_missing_imports", "remove_unused_imports" },
        code_lens = "off",
        jsx_close_tag = {
          enable = false,
        },
        tsserver_file_preferences = {
          includePackageJsonAutoImports = "off",
          includeCompletionsForModuleExports = false,
          updateImportsOnPaste = "off",
        },
      },
    },
  },
}
