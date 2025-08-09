return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "astro-language-server",
        "bash-language-server",
        "biome",
        "clangd",
        "deno",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "eslint-lsp",
        "gofumpt",
        "gopls",
        "hadolint",
        "json-lsp",
        "lua-language-server",
        "prettier",
        "rust-analyzer",
        "stylua",
        "svelte-language-server",
        "tailwindcss-language-server",
        "taplo",
        "vtsls",
        "yaml-language-server",
      },
    },
  },
  -- {
  --   "pmizio/typescript-tools.nvim",
  --   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
  --   opts = {
  --     single_file_support = false,
  --     settings = {
  --       publish_diagnostic_on = "insert_leave",
  --       expose_as_code_action = "all",
  --       complete_function_calls = false,
  --       include_completions_with_insert_text = false,
  --       code_lens = "off",
  --       disable_member_code_lens = true,
  --       tsserver_file_preferences = {
  --         includePackageJsonAutoImports = "off",
  --       },
  --       tsserver_format_options = {
  --         enable = false,
  --       },
  --     },
  --   },
  -- },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    opts = function()
      local util = require("lspconfig.util")
      return {
        inlay_hints = {
          enabled = false,
        },
        codelens = {
          enabled = false,
        },
        servers = {
          vtsls = {
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
              -- tsserver = {
              --   globalPlugins = {
              --     {
              --       name = "@astrojs/ts-plugin",
              --       location = "~/.local/share/nvim/mason/packages/astro-language-server/node_modules/@astrojs/language-server",
              --       enableForWorkspaceTypeScriptVersions = true,
              --     },
              --     {
              --       name = "typescript-svelte-plugin",
              --       location = "~/.local/share/nvim/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin",
              --       enableForWorkspaceTypeScriptVersions = true,
              --     },
              --   },
              -- },
            },
          },
          eslint = {
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
          },
          biome = {
            single_file_support = false,
          },
          lua_ls = {
            settings = {
              Lua = {
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
          },
          yamlls = {
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
          },
          astro = {
            filetypes = { "astro" },
            root_dir = util.root_pattern("astro.config.js", "astro.config.mjs", "astro.config.cjs", "astro.config.ts"),
          },
          dockerls = {},
          docker_compose_language_service = {},
          gopls = {
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
          },
          svelte = {},
          taplo = {},
          denols = {
            filetypes = {
              "javascript",
              "typescript",
            },
            root_dir = util.root_pattern("deno.json", "deno.jsonc"),
            settings = {
              suggest = {
                imports = {
                  hosts = {
                    ["https://deno.land"] = true,
                  },
                },
              },
            },
          },
          bashls = {},
          jsonls = {
            settings = {
              json = {
                format = {
                  enable = false,
                },
                validate = { enable = true },
              },
            },
          },
          rust_analyzer = {
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
          },
          clangd = {
            root_dir = function(fname)
              return util.root_pattern(
                "Makefile",
                "configure.ac",
                "configure.in",
                "config.h.in",
                "meson.build",
                "meson_options.txt",
                "build.ninja"
              )(fname) or util.root_pattern("compile_commands.json", "compile_flags.txt")(fname) or vim.fs.dirname(
                vim.fs.find(".git", { path = fname, upward = true })[1]
              )
            end,
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
          },
          tailwindcss = {
            settings = {
              tailwindCSS = {
                classAttributes = { "class", "className", "rootClassName", "class:list" },
                classFunctions = { "tw", "clsx", "cn" },
                validate = false,
                colorDecorators = false,
                codeActions = false,
                hovers = true,
              },
            },
          },
          -- end lsp setup
        },
        setup = {},
      }
    end,
    config = function(_, opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("owivim-lsp-attach", { clear = true }),
        callback = function(event)
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "Lsp: " .. desc })
          end

          map("gd", vim.lsp.buf.definition, "Goto definition")
          map("gy", vim.lsp.buf.type_definition, "Goto Type definition")
          map("gD", vim.lsp.buf.declaration, "Goto declaration")
          -- Some default keymap
          -- "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
          -- "gra" is mapped in Normal and Visual mode to |vim.lsp.buf.code_action()|
          -- "grr" is mapped in Normal mode to |vim.lsp.buf.references()|
          -- "gri" is mapped in Normal mode to |vim.lsp.buf.implementation()|
          -- "gO" is mapped in Normal mode to |vim.lsp.buf.document_symbol()|
          -- CTRL-S is mapped in Insert mode to |vim.lsp.buf.signature_help()|
        end,
      })

      local lspconfig = require("lspconfig")
      for server, config in pairs(opts.servers) do
        config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end
    end,
  },
}
