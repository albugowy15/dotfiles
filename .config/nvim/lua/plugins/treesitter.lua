return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    main = "nvim-treesitter.configs",
    cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
    opts = {
      ensure_installed = {
        "astro",
        "bash",
        "c",
        "cpp",
        "csv",
        "css",
        "diff",
        "dockerfile",
        "editorconfig",
        "gitattributes",
        "gitcommit",
        "gitignore",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "graphql",
        "html",
        "hyprlang",
        "javascript",
        "jsdoc",
        "json5",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "prisma",
        "proto",
        "rust",
        "scss",
        "sql",
        "svelte",
        "tsx",
        "typescript",
        "toml",
        "vim",
        "vimdoc",
        "yaml",
        "xml",
      },
      -- Autoinstall languages that are not installed
      auto_install = false,
      highlight = {
        enable = true,
      },
      indent = { enable = true },
    },
  },
}
