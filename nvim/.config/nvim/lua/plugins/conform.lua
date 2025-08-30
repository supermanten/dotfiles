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
				dart = { "dartls" },
				go = { "goimports", "gofumpt" },
				python = { "ruff_format", "ruff_fix" },
				cpp = { "clang_format" },
				c = { "clang_format" },

				-- Expanded web development support
				javascript = { "prettierd", "prettier" },
				typescript = { "prettierd", "prettier" },
				javascriptreact = { "prettierd", "prettier" },
				typescriptreact = { "prettierd", "prettier" },
				css = { "prettierd", "prettier" },
				html = { "prettierd", "prettier" },
				json = { "prettierd", "prettier" },
				yaml = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier" },
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
