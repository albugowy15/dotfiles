return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        -- Load luvit types when the `vim.uv` word is found
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
        "prettier",
        "goimports",
        "gofumpt",
        "gomodifytags",
        "impl",
        "stylua",
        "prettier",
        "shellcheck",
        "hadolint",
        "phpcs",
        "php-cs-fixer",
      },
    },
    ---@param opts MasonSettings | {ensure_installed: string[]}
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      mr:on("package:install:success", function()
        vim.defer_fn(function()
          -- trigger FileType event to possibly load this newly installed LSP server
          require("lazy.core.handler.event").trigger({
            event = "FileType",
            buf = vim.api.nvim_get_current_buf(),
          })
        end, 100)
      end)

      mr.refresh(function()
        for _, tool in ipairs(opts.ensure_installed) do
          local p = mr.get_package(tool)
          if not p:is_installed() then
            p:install()
          end
        end
      end)
    end,
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
      { "j-hui/fidget.nvim", opts = {} },
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
          clangd = {},
          pyright = {},
          rust_analyzer = { enabled = false },
          -- ts_ls = {
          --   root_dir = util.root_pattern("package.json"),
          --   single_file_support = false,
          -- },
          vtsls = {
            single_file_support = false,
            root_dir = util.root_pattern("package.json"),
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
                    -- location = LazyVim.get_pkg_path("svelte-language-server", "/node_modules/typescript-svelte-plugin"),
                    location = "~/.local/share/nvim/mason/packages/svelte-language-server/node_modules/typescript-svelte-plugin",
                    enableForWorkspaceTypeScriptVersions = true,
                  },
                },
              },
            },
            keys = {
              {
                "gD",
                function()
                  local params = vim.lsp.util.make_position_params()
                  return vim.lsp.buf_request(0, "workspace/executeCommand", {
                    command = "typescript.goToSourceDefinition",
                    arguments = {
                      params.textDocument.uri,
                      params.position,
                    },
                  })
                end,
                desc = "Goto Source Definition",
              },
            },
          },

          tailwindcss = {
            filetypes_exclude = { "markdown" },
            -- root_dir = util.root_pattern(
            --   "tailwind.config.js",
            --   "tailwind.config.cjs",
            --   "tailwind.config.mjs",
            --   "tailwind.config.ts"
            -- ),
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
          eslint = {
            settings = {
              -- workingDirectories = { mode = "auto" },
              format = false,
            },
          },
          astro = {
            filetypes = { "astro" },
            root_dir = require("lspconfig.util").root_pattern(
              "astro.config.js",
              "astro.config.mjs",
              "astro.config.cjs",
              "astro.config.ts"
            ),
          },
          dockerls = {},
          docker_compose_language_service = {},
          gopls = {},
          prismals = {
            root_dir = util.root_pattern("package.json"),
          },
          svelte = {},
          taplo = {},
          denols = {
            filetypes = {
              "javascript",
              "typescript",
            },
            root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
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
          marksman = {},
          intelephense = {},
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
