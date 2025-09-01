-- vtsls currently attaches to Deno projects, which is problematic
-- because Deno has its own built-in TypeScript LSP implementation.
-- Workaround: Manually stop VTSLS in Deno projects using the command:
--   :LspStop vtsls
vim.lsp.config("vtsls", {
  single_file_support = false,
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
          entriesLimit = 20,
          enableServerSideFuzzyMatch = true,
        },
      },
      typescript = {
        updateImportsOnFileMove = { enabled = "always" },
        preferences = {
          includePackageJsonAutoImports = "off",
        },
        format = {
          enable = false,
        },
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

vim.lsp.config("tailwindcss", {
  settings = {
    tailwindCSS = {
      classAttributes = { "class", "className", "rootClassName", "class:list" },
      classFunctions = { "tw", "clsx", "cn" },
      validate = false,
      colorDecorators = false,
      codeActions = false,
      hover = true,
    },
  },
})

vim.lsp.config("astro", {
  filetypes = { "astro" },
  root_markers = { "astro.config.js", "astro.config.mjs", "astro.config.cjs", "astro.config.ts" },
})

vim.lsp.enable({
  "astro",
  "bashls",
  "denols",
  "eslint",
  "gopls",
  "jsonls",
  "lua_ls",
  "rust_analyzer",
  "tailwindcss",
  "taplo",
  "vtsls",
  "yamlls",
})
