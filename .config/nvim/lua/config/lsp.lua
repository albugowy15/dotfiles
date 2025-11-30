vim.lsp.config("vtsls", {
  single_file_support = false,
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
    typescript = {
      tsserver = {
        maxTsServerMemory = 6144,
        useSeparateSyntaxServer = false,
        useSyntaxServer = "never",
      },
      preferences = {
        includePackageJsonAutoImports = "off",
        includeCompletionsForModuleExports = false,
        updateImportsOnPaste = "off",
      },
    },
    vtsls = {
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
      experimental = {
        completion = {
          entriesLimit = 20,
          enableServerSideFuzzyMatch = true,
        },
      },
      typescript = {
        updateImportsOnFileMove = { enabled = "always" },
        preferences = {
          includePackageJsonAutoImports = "off",
          includeCompletionsForModuleExports = false,
          updateImportsOnPaste = "off",
        },
        format = {
          enable = false,
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
        -- {
        --   name = "typescript-svelte-plugin",
        --   location = "~/.local/share/nvim/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin",
        --   enableForWorkspaceTypeScriptVersions = true,
        -- },
      },
    },
  },
})

vim.lsp.config("eslint", {
  settings = {
    codeActionOnSave = {
      enable = false,
      mode = "problems",
    },
    quiet = true,
    format = false,
    run = "onSave",
    workingDirectories = { mode = "auto" },
  },
})

vim.lsp.config("biome", {
  single_file_support = false,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      completion = {
        callSnippet = "Replace",
      },
    },
  },
})

vim.lsp.config("yamlls", {
  capabilities = {
    textDocument = {
      foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      },
    },
  },
  settings = {
    redhat = { telemetry = { enabled = false } },
    yaml = {
      keyOrdering = false,
      format = {
        enable = true,
      },
      validate = true,
      schemaStore = {
        enable = false,
        url = "",
      },
    },
  },
})

vim.lsp.config("astro", {
  filetypes = { "astro" },
  -- root_markers = { "astro.config.js", "astro.config.mjs", "astro.config.cjs", "astro.config.ts" },
})

vim.lsp.config("gopls", {
  settings = {
    gopls = {
      gofumpt = true,
      codelenses = {
        gc_details = false,
        generate = true,
        regenerate_cgo = true,
        run_govulncheck = true,
        test = true,
        tidy = true,
        upgrade_dependency = true,
        vendor = true,
      },
      analyses = {
        nilness = true,
        unusedparams = true,
        unusedwrite = true,
        useany = true,
      },
      usePlaceholders = false,
      completeUnimported = true,
      staticcheck = true,
      directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
      semanticTokens = true,
    },
  },
})

vim.lsp.config("denols", {
  filetypes = {
    "typescript",
  },
  workspace_required = true,
  root_markers = { "deno.json", "deno.jsonc" },
  settings = {
    suggest = {
      imports = {
        hosts = {
          ["https://deno.land"] = true,
        },
      },
    },
  },
})

vim.lsp.config("jsonls", {
  settings = {
    json = {
      format = {
        enable = false,
      },
      validate = { enable = true },
    },
  },
})

vim.lsp.config("rust_analyzer", {
  settings = {
    imports = {
      granularity = {
        group = "module",
      },
      prefix = "self",
    },
    cargo = {
      buildScripts = {
        enable = true,
      },
    },
    procMacro = {
      enable = true,
    },
  },
})

vim.lsp.config("clangd", {
  -- root_dir = function(fname)
  --   return util.root_pattern(
  --     "Makefile",
  --     "configure.ac",
  --     "configure.in",
  --     "config.h.in",
  --     "meson.build",
  --     "meson_options.txt",
  --     "build.ninja"
  --   )(fname) or util.root_pattern("compile_commands.json", "compile_flags.txt")(fname) or vim.fs.dirname(
  --     vim.fs.find(".git", { path = fname, upward = true })[1]
  --   )
  -- end,
  capabilities = {
    offsetEncoding = { "utf-16" },
  },
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--header-insertion=iwyu",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--fallback-style=llvm",
  },
  init_options = {
    usePlaceholders = true,
    completeUnimported = true,
    clangdFileStatus = true,
  },
})

vim.lsp.config("tailwindcss", {
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "rootClassName", "class:list" },
      classFunctions = { "clsx", "cn" },
      completion = false,
      validate = false,
      colorDecorators = false,
      codeActions = false,
      hovers = true,
    },
  },
})

vim.lsp.config("jdtls", {
  settings = {
    java = {
      format = {
        enabled = true,
        settings = {
          url = vim.fn.stdpath("config") .. "/eclipse-java-style.xml",
          profile = "GoogleStyle",
        },
      },
      saveActions = {
        organizeImports = true,
      },
    },
  },
})

vim.lsp.config("tsgo", {
  filetypes = {
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
})

vim.lsp.enable({
  "astro",
  "bashls",
  "denols",
  "dockerls",
  "eslint",
  "gopls",
  "jsonls",
  "lemminx",
  "lua_ls",
  "rust_analyzer",
  "tailwindcss",
  "taplo",
  -- "tsgo",
  -- "vtsls",
  "yamlls",
  -- "biome",
  -- "clangd",
  -- "jdtls",
  -- "lemminx",
})
