return {
  -- cmd = {},
  root_markers = { "tsconfig.json" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  settings = {
    complete_function_calls = false,
    vtsls = {
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = {
          entriesLimit = 10,
          enableServerSideFuzzyMatch = true,
        },
      },
      javascript = {
        preferences = {
          includePackageJsonAutoImports = "off",
        },
        format = {
          enabled = false,
        },
        suggest = {
          completeFunctionCalls = false,
        },
        inlayHints = {
          enumMemberValues = { enabled = false },
          functionLikeReturnTypes = { enabled = false },
          parameterTypes = { enabled = false },
          propertyDeclarationTypes = { enabled = false },
          variableTypes = { enabled = false },
        },
      },
      typescript = {
        preferences = {
          includePackageJsonAutoImports = "off",
        },
        format = {
          enable = false,
        },
        suggest = {
          completeFunctionCalls = false,
        },
        inlayHints = {
          enumMemberValues = { enabled = false },
          functionLikeReturnTypes = { enabled = false },
          parameterTypes = { enabled = false },
          propertyDeclarationTypes = { enabled = false },
          variableTypes = { enabled = false },
        },
      },
    },
    tsserver = {
      globalPlugins = {
        {
          name = "@astrojs/ts-plugin",
          location = "~/.local/share/nvim/mason/packages/astro-language-server/node_modules/@astrojs/language-server",
          enableForWorkspaceTypeScriptVersions = true,
        },
        {
          name = "typescript-svelte-plugin",
          location = "~/.local/share/nvim/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin",
          enableForWorkspaceTypeScriptVersions = true,
        },
      },
    },
  },
}
