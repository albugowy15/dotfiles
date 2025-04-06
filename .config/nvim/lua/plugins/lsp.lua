return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts_extend = { "ensure_installed" },
    opts = {
      ensure_installed = {
        "prettier_d",
        "gofumpt",
        "stylua",
        "shellcheck",
        "hadolint",
      },
    },
  },
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
          },
          eslint = {
            settings = {
              workingDirectories = { mode = "auto" },
              format = false,
              run = "onSave",
              problems = {
                shortenToSingleLine = true,
              },
              codeActionOnSave = {
                enable = false,
                mode = "problems",
              },
              quiet = true,
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
          gopls = {},
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
