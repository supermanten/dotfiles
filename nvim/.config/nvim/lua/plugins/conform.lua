return {
	{
		"stevearc/conform.nvim",
		lazy = false,
		keys = {
			{
				"<leader>fc",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
				mode = { "n", "v" },
				desc = "Format buffer",
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				go = { "goimports", "gofumpt" },
				python = { "ruff_format", "ruff_fix" },
				cpp = { "clang_format" },
				c = { "clang_format" },
			},
		},
		-- Enable format-on-save using an autocmd
		config = function(_, opts)
			require("conform").setup(opts)

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					require("conform").format({
						bufnr = args.buf,
						timeout_ms = 500,
						lsp_fallback = true,
					})
				end,
			})
		end,
	},
}
