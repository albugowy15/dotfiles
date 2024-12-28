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
				"stylua",
				"prettier",
			},
			-- ui = {
			-- 	icons = {
			-- 		package_installed = "✓",
			-- 		package_pending = "➜",
			-- 		package_uninstalled = "✗",
			-- 	},
			-- },
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
		opts = function()
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
					ts_ls = {
						root_dir = require("lspconfig.util").root_pattern("package.json"),
						single_file_support = false,
					},
					tailwindcss = {
						filetypes_exclude = { "markdown" },
						filetypes_include = {},
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
							workingDirectories = { mode = "auto" },
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
					dockerls = {
						filetypes = { "dockerfile" },
						root_dir = require("lspconfig.util").root_pattern(
							"Dockerfile",
							"docker-compose.yml",
							"compose.yml",
							"docker-compose.yaml",
							"compose.yaml"
						),
					},
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
								hints = {
									assignVariableTypes = true,
									compositeLiteralFields = true,
									compositeLiteralTypes = true,
									constantValues = true,
									functionTypeParameters = true,
									parameterNames = true,
									rangeVariableTypes = true,
								},
								usePlaceholders = false,
								completeUnimported = true,
								staticcheck = true,
								directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
								semanticTokens = false,
							},
						},
					},
					prismals = {},
					svelte = {},
					taplo = {},
					volar = {
						init_options = {
							vue = {
								hybridMode = true,
							},
						},
					},
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
			local servers = opts.servers
			local capabilities = vim.tbl_deep_extend(
				"force",
				{},
				vim.lsp.protocol.make_client_capabilities(),
				require("blink.cmp").get_lsp_capabilities() or {},
				opts.capabilities or {}
			)
			local function setup(server)
				local server_opts = vim.tbl_deep_extend("force", {
					capabilities = vim.deepcopy(capabilities),
				}, servers[server] or {})
				if server_opts.enabled == false then
					return
				end

				if opts.setup[server] then
					if opts.setup[server](server, server_opts) then
						return
					end
				elseif opts.setup["*"] then
					if opts.setup["*"](server, server_opts) then
						return
					end
				end
				require("lspconfig")[server].setup(server_opts)
			end

			local have_mason, mlsp = pcall(require, "mason-lspconfig")
			local all_mslp_servers = {}
			if have_mason then
				all_mslp_servers = vim.tbl_keys(require("mason-lspconfig.mappings.server").lspconfig_to_package)
			end
			local ensure_installed = {} ---@type string[]
			for server, server_opts in pairs(servers) do
				if server_opts then
					server_opts = server_opts == true and {} or server_opts
					if server_opts.enabled ~= false then
						-- run manual setup if mason=false or if this is a server that cannot be installed with mason-lspconfig
						if server_opts.mason == false or not vim.tbl_contains(all_mslp_servers, server) then
							setup(server)
						else
							ensure_installed[#ensure_installed + 1] = server
						end
					end
				end
			end
			local enopts = require("mason-lspconfig").get_installed_servers()
			if have_mason then
				mlsp.setup({
					automatic_installation = false,
					ensure_installed = vim.tbl_deep_extend("force", ensure_installed, enopts or {}),
					handlers = { setup },
				})
			end

			-- local lspconfig = require("lspconfig")
			-- for server, config in pairs(opts.servers) do
			-- 	-- passing config.capabilities to blink.cmp merges with the capabilities in your
			-- 	-- `opts[server].capabilities, if you've defined it
			-- 	config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
			-- 	lspconfig[server].setup(config)
			-- end
		end,
	},
}
