	return {
	{
		"stevearc/conform.nvim",
		event = { "BufWritePre", "BufReadPre" },
		lazy = true,
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
			python = { "ruff_format", "ruff_fix", "black", "isort" },
			cpp = { "clang_format" },
			c = { "clang_format" },
			rust = { "rustfmt" },
			java = { "google_java_format" },

			-- Expanded web development support
			javascript = { "prettierd", "prettier", "eslint_d" },
			typescript = { "prettierd", "prettier", "eslint_d" },
			javascriptreact = { "prettierd", "prettier", "eslint_d" },
			typescriptreact = { "prettierd", "prettier", "eslint_d" },
			css = { "prettierd", "prettier", "stylelint" },
			html = { "prettierd", "prettier" },
			json = { "prettierd", "prettier", "jq" },
			yaml = { "prettierd", "prettier", "yamlfmt" },
			markdown = { "prettierd", "prettier", "markdownlint" },
			sh = { "shfmt", "shellcheck" },
			bash = { "shfmt", "shellcheck" },
			zsh = { "shfmt", "shellcheck" },
		},
		},
		-- Enable format-on-save using an autocmd
		config = function(_, opts)
			require("conform").setup(opts)

			vim.api.nvim_create_autocmd("BufWritePre", {
				pattern = "*",
				callback = function(args)
					local file_size = vim.fn.getfsize(vim.api.nvim_buf_get_name(args.buf))
					local max_file_size = 1024 * 1024 -- 1MB

					-- Skip formatting for large files
					if file_size > max_file_size then
						return
					end

					-- Skip formatting for certain filetypes
					local filetype = vim.bo[args.buf].filetype
					local skip_filetypes = { "markdown", "text", "log" }
					if vim.tbl_contains(skip_filetypes, filetype) then
						return
					end

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
