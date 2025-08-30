return {
	{
		"williamboman/mason.nvim",
		lazy = true,
		cmd = "Mason",
		config = function()
			require("mason").setup({
				ui = {
					border = "rounded",
				},
			})
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		lazy = true,
		cmd = { "LspInstall", "LspUninstall" },
		dependencies = { "williamboman/mason.nvim" },
		opts = {
			auto_install = true,
			-- ensure_installed = { "lua_ls", "rust_analyzer" }
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = true,
		event = { "BufReadPre", "BufNewFile" },
		dependencies = { "williamboman/mason-lspconfig.nvim" },
		config = function()
			local ok, blink_cmp = pcall(require, "blink.cmp")
			if not ok then
				vim.notify("blink.cmp not found, LSP capabilities may be limited", vim.log.levels.WARN)
				return
			end

			local capabilities = blink_cmp.get_lsp_capabilities()

			local ok_lspconfig, lspconfig = pcall(require, "lspconfig")
			if not ok_lspconfig then
				vim.notify("lspconfig not found", vim.log.levels.ERROR)
				return
			end

			-- Configure diagnostic display (error lenses)
			vim.diagnostic.config({
				virtual_text = {
					prefix = "●",
					spacing = 4,
				},
				signs = true, -- Enable signs
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				-- Enhanced diagnostics
				float = {
					border = "rounded",
					source = "always",
					header = "",
					prefix = "",
				},
			})

			-- Enhanced hover and signature help
			vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
				border = "rounded",
				max_width = 80,
				max_height = 20,
			})

			vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
				border = "rounded",
				max_width = 80,
				max_height = 20,
			})

			-- Configure inlay hints (if supported by LSP)
			vim.lsp.inlay_hint.enable(true)

			-- Enhanced LSP capabilities
			local enhanced_capabilities = vim.tbl_deep_extend("force", capabilities, {
				textDocument = {
					inlayHint = {
						dynamicRegistration = false,
						resolveSupport = {
							properties = { "tooltip", "location", "command" },
						},
					},
					codeLens = {
						dynamicRegistration = false,
					},
					semanticTokens = {
						dynamicRegistration = false,
						tokenTypes = {
							"namespace",
							"type",
							"class",
							"enum",
							"interface",
							"struct",
							"typeParameter",
							"parameter",
							"variable",
							"property",
							"enumMember",
							"event",
							"function",
							"method",
							"macro",
							"keyword",
							"modifier",
							"comment",
							"string",
							"number",
							"regexp",
							"operator",
						},
						tokenModifiers = {
							"declaration",
							"definition",
							"readonly",
							"static",
							"deprecated",
							"abstract",
							"async",
							"modification",
							"documentation",
							"defaultLibrary",
						},
						formats = { "relative" },
						overlappingTokenSupport = true,
						multilineTokenSupport = true,
					},
				},
			})

			-- Set diagnostic signs
			local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			-- Optional: Add keybinding to toggle virtual text
			vim.keymap.set("n", "<leader>dv", function()
				local config = vim.diagnostic.config()
				vim.diagnostic.config({
					virtual_text = not config.virtual_text,
				})
				vim.notify(
					config.virtual_text and "Virtual text disabled" or "Virtual text enabled",
					vim.log.levels.INFO
				)
			end, { desc = "Toggle diagnostic virtual text" })

			-- Add keybinding to restart LSP servers (useful if duplicates occur)
			vim.keymap.set("n", "<leader>lr", function()
				vim.cmd("LspRestart")
				vim.notify("LSP servers restarted", vim.log.levels.INFO)
			end, { desc = "Restart LSP servers" })

			local servers = {
				"lua_ls",
				"dartls",
				"gopls",
				"pyright",
				"rust_analyzer",
				"clangd",
				"jdtls",
				-- Additional language servers
				"ts_ls", -- TypeScript/JavaScript
				"html", -- HTML
				"cssls", -- CSS
				"jsonls", -- JSON
				"yamlls", -- YAML
				"bashls", -- Bash
				"dockerls", -- Docker
			} -- rust_analyzer need rust-src need installed

			for _, lsp in ipairs(servers) do
				local ok_setup, err = pcall(function()
					-- Check if LSP is already running to prevent duplicates
					local clients = vim.lsp.get_clients({ name = lsp })
					if #clients > 0 then
						vim.notify("LSP " .. lsp .. " already running, skipping duplicate setup", vim.log.levels.DEBUG)
						return
					end

					-- Server-specific configurations
					local server_opts = {
						capabilities = enhanced_capabilities, -- Use enhanced capabilities
						-- Prevent duplicate LSP servers
						single_file_support = false,
					}

					-- Add server-specific settings
					if lsp == "lua_ls" then
						server_opts.settings = {
							Lua = {
								runtime = { version = "LuaJIT" },
								diagnostics = { globals = { "vim" } },
								workspace = {
									library = vim.api.nvim_get_runtime_file("", true),
									checkThirdParty = false,
								},
								telemetry = { enable = false },
								hint = { enable = true },
							},
						}
					elseif lsp == "pyright" then
						server_opts.settings = {
							python = {
								analysis = {
									autoSearchPaths = true,
									useLibraryCodeForTypes = true,
									diagnosticMode = "openFilesOnly",
								},
							},
						}
					elseif lsp == "ts_ls" then
						server_opts.settings = {
							typescript = {
								inlayHints = {
									includeInlayParameterNameHints = "all",
									includeInlayParameterNameHintsWhenArgumentMatchesName = false,
									includeInlayFunctionParameterTypeHints = true,
									includeInlayVariableTypeHints = true,
									includeInlayPropertyDeclarationTypeHints = true,
									includeInlayFunctionLikeReturnTypeHints = true,
									includeInlayEnumMemberValueHints = true,
								},
							},
							javascript = {
								inlayHints = {
									includeInlayParameterNameHints = "all",
									includeInlayParameterNameHintsWhenArgumentMatchesName = false,
									includeInlayFunctionParameterTypeHints = true,
									includeInlayVariableTypeHints = true,
									includeInlayVariableTypeHintsWhenTypeMatchesName = false,
									includeInlayPropertyDeclarationTypeHints = true,
									includeInlayFunctionLikeReturnTypeHints = true,
									includeInlayEnumMemberValueHints = true,
								},
							},
						}
					end

					-- Add enhanced on_attach function
					server_opts.on_attach = function(client, bufnr)
						-- Ensure only one client per buffer per server
						if #clients > 1 then
							vim.notify("Multiple " .. lsp .. " clients detected, keeping only one", vim.log.levels.WARN)
							-- Keep the first client, stop others
							for i = 2, #clients do
								clients[i]:stop()
							end
						end

						-- Enable inlay hints if supported
						if client.server_capabilities.inlayHintProvider then
							vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
						end

						-- Enable code lens if supported
						if client.server_capabilities.codeLensProvider then
							vim.lsp.codelens.refresh()
							vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
								buffer = bufnr,
								callback = vim.lsp.codelens.refresh,
							})
						end

						-- Enhanced keybindings for this buffer
						local bufopts = { noremap = true, silent = true, buffer = bufnr }

						-- Go to declaration (separate from definition)
						vim.keymap.set("n", "<leader>lD", vim.lsp.buf.declaration, bufopts)

						-- Show type definition
						vim.keymap.set("n", "<leader>lt", vim.lsp.buf.type_definition, bufopts)

						-- Show implementations
						vim.keymap.set("n", "<leader>li", vim.lsp.buf.implementation, bufopts)

						-- Show signature help
						vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, bufopts)

						-- Format document
						vim.keymap.set("n", "<leader>lf", function()
							vim.lsp.buf.format({ async = true })
						end, bufopts)

						-- Toggle inlay hints
						vim.keymap.set("n", "<leader>lh", function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
						end, bufopts)

						-- Enable semantic highlighting if supported
						if client.server_capabilities.semanticTokensProvider then
							local semantic = vim.lsp.semantic_tokens
							if semantic then
								semantic.start(bufnr, client.id)
							end
						end
					end

					lspconfig[lsp].setup(server_opts)
				end)
				if not ok_setup then
					vim.notify("Failed to setup LSP " .. lsp .. ": " .. err, vim.log.levels.WARN)
				end
			end
		end,
	},
}
