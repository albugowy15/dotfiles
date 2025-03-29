return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },
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
            -- lazy-load schemastore when needed
            on_new_config = function(new_config)
              new_config.settings.yaml.schemas = vim.tbl_deep_extend(
                "force",
                new_config.settings.yaml.schemas or {},
                require("schemastore").yaml.schemas()
              )
            end,
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
            -- lazy-load schemastore when needed
            on_new_config = function(new_config)
              new_config.settings.json.schemas = new_config.settings.json.schemas or {}
              vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
            end,
            settings = {
              json = {
                format = {
                  enable = false,
                },
                validate = { enable = true },
              },
            },
          },
        },
        setup = {},
      }
    end,
    config = function(_, opts)
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("owivim-lsp-attach", { clear = true }),
        callback = function(event)
          local function client_support_method(client, method, bufnr)
            return client:supports_method(method, bufnr)
          end
          local client = vim.lsp.get_client_by_id(event.data.client_id)

          if
            client and client_support_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
          then
            local higlight_augroup = vim.api.nvim_create_augroup("owivim-lsp-highlight", { clear = false })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              buffer = event.buf,
              group = higlight_augroup,
              callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              buffer = event.buf,
              group = higlight_augroup,
              callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd("LspDetach", {
              group = vim.api.nvim_create_augroup("owivim-lsp-detach", { clear = true }),
              callback = function(event2)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds({ group = "owivim-lsp-attach", buffer = event2.buf })
              end,
            })
          end
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
