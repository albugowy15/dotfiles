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
        diagnostics = {
          severity_sort = true,
        },
        inlay_hints = {
          enabled = false,
        },
        codelens = {
          enabled = false,
        },
        servers = {
          vtsls = {
            single_file_support = false,
            root_dir = util.root_pattern("tsconfig.json"),
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
                javascript = {
                  format = {
                    enabled = false,
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
            },
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
                  enable = true,
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
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
          end
          map("<leader>cl", "<cmd>LspInfo<cr>", "Lsp Info")
          map("gd", vim.lsp.buf.definition, "Goto Definition")
          map("gr", vim.lsp.buf.references, "References")
          map("gI", vim.lsp.buf.implementation, "Goto Implementation")
          map("gy", vim.lsp.buf.type_definition, "Goto T[y]pe Definition")
          map("gD", vim.lsp.buf.declaration, "Goto Declaration")
          map("K", function()
            return vim.lsp.buf.hover()
          end, "Hover")
          map("gK", function()
            return vim.lsp.buf.signature_help()
          end, "Signature Help")
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "v" })
          map("<leader>cr", vim.lsp.buf.rename, "Rename")
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
