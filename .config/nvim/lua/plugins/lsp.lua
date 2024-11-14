return {
  {
    "williamboman/mason.nvim",
    opts = { ensure_installed = { "deno" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = false,
      },
      servers = {
        gopls = {
          settings = {
            gopls = {
              hints = {},
              usePlaceholders = false,
            },
          },
        },
        vtsls = {
          settings = {
            complete_function_calls = false,
            vtsls = {
              enableMoveToFileCodeAction = true,
              autoUseWorkspaceTsdk = true,
              experimental = {
                completion = {
                  enableServerSideFuzzyMatch = false,
                },
              },
            },
            typescript = {
              suggest = {
                completeFunctionCalls = false,
              },
              inlayHints = {},
            },
          },
        },
      },
    },
  },
}
