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

			local servers = {
				"lua_ls",
				"dartls",
				"gopls",
				"pyright",
				"rust_analyzer",
				"clangd",
				"jdtls",
			} -- rust_analyzer need rust-src need installed

			for _, lsp in ipairs(servers) do
				local ok_setup, err = pcall(function()
					lspconfig[lsp].setup({
						capabilities = capabilities,
					})
				end)
				if not ok_setup then
					vim.notify("Failed to setup LSP " .. lsp .. ": " .. err, vim.log.levels.WARN)
				end
			end
		end,
	},
}
