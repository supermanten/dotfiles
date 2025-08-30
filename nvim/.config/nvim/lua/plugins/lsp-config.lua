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
			} -- rust_analyzer need rust-src need installed

			-- Prevent duplicate LSP setup by using a registry
			local lsp_registry = {}

			for _, lsp in ipairs(servers) do
				local ok_setup, err = pcall(function()
					-- Check registry first (more reliable than get_clients during startup)
					if lsp_registry[lsp] then
						vim.notify(
							"LSP " .. lsp .. " already registered, skipping duplicate setup",
							vim.log.levels.DEBUG
						)
						return
					end

					-- Mark as registered
					lsp_registry[lsp] = true

					lspconfig[lsp].setup({
						capabilities = capabilities,
						-- Prevent duplicate LSP servers
						single_file_support = false,
						-- Add on_attach to handle cleanup
						on_attach = function(_, bufnr)
							-- Ensure only one client per buffer per server
							local clients = vim.lsp.get_clients({ bufnr = bufnr, name = lsp })
							if #clients > 1 then
								vim.notify(
									"Multiple " .. lsp .. " clients detected, keeping only one",
									vim.log.levels.WARN
								)
								-- Keep the first client, stop others
								for i = 2, #clients do
									clients[i]:stop()
								end
							end
						end,
					})
				end)
				if not ok_setup then
					vim.notify("Failed to setup LSP " .. lsp .. ": " .. err, vim.log.levels.WARN)
				end
			end
		end,
	},
}
