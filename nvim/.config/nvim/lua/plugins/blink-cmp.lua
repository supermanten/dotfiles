return {
	"saghen/blink.cmp",
	dependencies = {
		{ "saghen/blink.compat", opts = { enable_events = true } },
		{
			"Exafunction/codeium.nvim",
			dependencies = {
				"nvim-lua/plenary.nvim",
			},
		},
		{
			"L3MON4D3/LuaSnip",
			dependencies = { "rafamadriz/friendly-snippets" },
			opts = {
				-- configuration for luasnip
			},
			config = function()
				require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })
			end,
		},
	},
	lazy = false, -- lazy loading handled internally
	version = "v0.*",
	---@module 'blink.cmp'
	opts = {
		keymap = {
			preset = "default",
			["<C-z>"] = { "select_and_accept" },
			["<S-Tab>"] = { "select_prev", "fallback" },
			["<Tab>"] = { "select_next", "fallback" },

			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },

			["<S-k>"] = { "scroll_documentation_up", "fallback" },
			["<S-j>"] = { "scroll_documentation_down", "fallback" },

			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<C-a>"] = {
				function(cmp)
					cmp.show({ providers = { "codeium" } })
				end,
			},
		},
		appearance = {
			kind_icons = {
				Text = " ",
				Method = " ",
				Function = " ",
				Constructor = " ",
				Field = " ",
				Variable = " ",
				Property = " ",
				Class = " ",
				Interface = " ",
				Struct = " ",
				Module = " ",
				Unit = " ",
				Value = " ",
				Enum = " ",
				EnumMember = " ",
				Keyword = " ",
				Constant = " ",
				Snippet = " ",
				Color = " ",
				File = " ",
				Reference = " ",
				Folder = " ",
				Event = " ",
				Operator = " ",
				TypeParameter = " ",
			},
		},
		snippets = { preset = "luasnip" },
		sources = {
			default = { "lsp", "codeium", "path", "snippets", "buffer" },
			providers = {
				codeium = {
					name = "codeium",
					module = "blink.compat.source",
					score_offset = 100,
					async = true,
					opts = {
						-- Codeium specific options
						managed = true,
					},
				},
			},
		},
		completion = {
			menu = {
				border = "rounded",
				winblend = 10,
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind", gap = 1 },
					},
				},
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 500,
				window = { border = "rounded", winblend = 10 },
			},
		},
		signature = { enabled = true, window = { border = "rounded" } },
		cmdline = {
			keymap = {
				["<Tab>"] = { "show", "accept" },
			},
			completion = { menu = { auto_show = true } },
		},
	},
	opts_extend = { "sources.default" },
}
