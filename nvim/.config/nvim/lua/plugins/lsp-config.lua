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
			local capabilities = require("blink.cmp").get_lsp_capabilities()

			local lspconfig = require("lspconfig")

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
				lspconfig[lsp].setup({
					capabilities = capabilities,
				})
			end
		end,
	},
}
