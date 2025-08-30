return {
	"nvim-lualine/lualine.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")
		local lazy_status = require("lazy.status") -- to configure lazy pending updates count

		-- Custom vibrant color scheme with excellent contrast and readability
		-- Inspired by modern dark themes with vibrant accents
		local colors = {
			-- Base colors - Deep dark with high contrast
			bg = "#0f0f23",           -- Deep dark blue background
			fg = "#e2e8f0",           -- Bright white foreground (high contrast)
			subtext1 = "#cbd5e1",     -- Light gray for secondary text
			subtext2 = "#94a3b8",     -- Medium gray
			subtext3 = "#64748b",     -- Darker gray
			subtext4 = "#475569",     -- Even darker gray
			bg_dark = "#0a0a14",     -- Darker background for contrast
			black = "#1e1e2e",        -- Dark background

			-- Vibrant accent colors - Carefully chosen for visibility
			red = "#ff6b6b",          -- Coral red (high visibility)
			green = "#51cf66",        -- Bright green (excellent contrast)
			yellow = "#ffd43b",       -- Golden yellow (warm and visible)
			purple = "#9775fa",       -- Soft purple (balanced)
			magenta = "#f783ac",      -- Pink magenta (vibrant)
			orange = "#ff922b",       -- Bright orange (energetic)
			blue = "#74c0fc",         -- Sky blue (calm and visible)
			cyan = "#4dabf7",         -- Bright cyan (modern)

			-- Bright variants for highlights - Slightly muted for better readability
			bright_red = "#ff8787",   -- Lighter red
			bright_green = "#69db7c", -- Lighter green
			bright_yellow = "#ffe066", -- Lighter yellow
			bright_purple = "#b197fc", -- Lighter purple
			bright_magenta = "#faa2c1", -- Lighter magenta
			bright_orange = "#ffb74d", -- Lighter orange
			bright_blue = "#8cc8ff",   -- Lighter blue
			bright_cyan = "#74d4ff",   -- Lighter cyan

			-- Gray scale for subtle elements - Consistent with base colors
			gray0 = "#0f0f23",        -- Same as bg
			gray1 = "#1a1a2e",        -- Slightly lighter
			gray2 = "#2a2a3e",        -- Medium gray-blue
			gray3 = "#3a3a4e",        -- Lighter gray-blue
			gray4 = "#4a4a5e",        -- Even lighter

			-- Special
			none = "NONE",
		}

		local icons = {
			misc = {
				dots = "󰇘",
			},
			ft = {
				octo = "",
			},
			dap = {
				Stopped = { "󰁕 ", "DiagnosticWarn", "DapStoppedLine" },
				Breakpoint = " ",
				BreakpointCondition = " ",
				BreakpointRejected = { " ", "DiagnosticError" },
				LogPoint = ".>",
			},
			diagnostics = {
				Error = " ",
				Warn = " ",
				Hint = " ",
				Info = " ",
			},
			git = {
				added = " ",
				modified = " ",
				removed = " ",
			},
			kinds = {
				Array = " ",
				Boolean = "󰨙 ",
				Class = " ",
				Codeium = "󰘦 ",
				Color = " ",
				Control = " ",
				Collapsed = " ",
				Constant = "󰏿 ",
				Constructor = " ",
				Copilot = " ",
				Enum = " ",
				EnumMember = " ",
				Event = " ",
				Field = " ",
				File = " ",
				Folder = " ",
				Function = "󰊕 ",
				Interface = " ",
				Key = " ",
				Keyword = " ",
				Method = "󰊕 ",
				Module = " ",
				Namespace = "󰦮 ",
				Null = " ",
				Number = "󰎠 ",
				Object = " ",
				Operator = " ",
				Package = " ",
				Property = " ",
				Reference = " ",
				Snippet = "󱄽 ",
				String = " ",
				Struct = "󰆼 ",
				Supermaven = " ",
				TabNine = "󰏚 ",
				Text = " ",
				TypeParameter = " ",
				Unit = " ",
				Value = " ",
				Variable = "󰀫 ",
			},
		}
		local modecolor = {
			-- Normal mode - vibrant blue
			n = colors.blue,
			no = colors.blue,
			-- Insert mode - bright green
			i = colors.green,
			ic = colors.green,
			-- Visual modes - purple/violet
			v = colors.purple,
			[""] = colors.bright_purple,
			V = colors.purple,
			-- Command/terminal modes - orange
			c = colors.orange,
			t = colors.bright_orange,
			-- Replace modes - red
			R = colors.red,
			Rv = colors.bright_red,
			-- Select modes - magenta
			s = colors.magenta,
			S = colors.magenta,
			[""] = colors.bright_magenta,
			-- Other modes
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
		}
		local modes = {
			"mode",
			color = function()
				local mode_color = modecolor
				return { bg = mode_color[vim.fn.mode()], fg = colors.bg_dark, gui = "bold" }
			end,
			separator = { left = "", right = "" },
			icon = " ",
			padding = { left = 1, right = 1 },
		}
		local branch = {
			"branch",
			icon = " ",
			color = { bg = colors.gray3, fg = colors.green, gui = "bold" },
			separator = { left = "", right = "" },
			padding = { left = 1, right = 1 },
		}

		local space = {
			function()
				return " "
			end,
			color = { bg = colors.bg_dark, fg = colors.blue },
		}
		-- configure lualine with modified theme
		lualine.setup({
			options = {
				theme = {
					normal = {
						a = { bg = colors.blue, fg = colors.bg_dark, gui = "bold" },
						b = { bg = colors.gray2, fg = colors.fg },
						c = { bg = colors.bg, fg = colors.fg },
					},
					insert = {
						a = { bg = colors.green, fg = colors.bg_dark, gui = "bold" },
						b = { bg = colors.gray2, fg = colors.fg },
						c = { bg = colors.bg, fg = colors.fg },
					},
					visual = {
						a = { bg = colors.purple, fg = colors.bg_dark, gui = "bold" },
						b = { bg = colors.gray2, fg = colors.fg },
						c = { bg = colors.bg, fg = colors.fg },
					},
					replace = {
						a = { bg = colors.red, fg = colors.bg_dark, gui = "bold" },
						b = { bg = colors.gray2, fg = colors.fg },
						c = { bg = colors.bg, fg = colors.fg },
					},
					command = {
						a = { bg = colors.orange, fg = colors.bg_dark, gui = "bold" },
						b = { bg = colors.gray2, fg = colors.fg },
						c = { bg = colors.bg, fg = colors.fg },
					},
					inactive = {
						a = { bg = colors.gray1, fg = colors.subtext3, gui = "bold" },
						b = { bg = colors.gray1, fg = colors.subtext3 },
						c = { bg = colors.gray1, fg = colors.subtext3 },
					},
				},
				icons_enabled = true,
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				globalstatus = true,
			},
			sections = {
				lualine_a = { modes },
				lualine_b = { space, branch },
				lualine_c = {
					{
						"diagnostics",
						symbols = {
							error = icons.diagnostics.Error,
							warn = icons.diagnostics.Warn,
							info = icons.diagnostics.Info,
							hint = icons.diagnostics.Hint,
						},
						color = {
							error = { fg = colors.bright_red },
							warn = { fg = colors.bright_yellow },
							info = { fg = colors.bright_blue },
							hint = { fg = colors.bright_cyan },
						},
					},
					{
						"filetype",
						icon_only = true,
						separator = "",
						padding = { left = 1, right = 0 },
						color = { fg = colors.blue }
					},
				},
				lualine_x = {
					{
						lazy_status.updates,
						cond = lazy_status.has_updates,
						color = { fg = colors.bright_orange, bg = colors.gray2 },
						separator = { left = "", right = "" },
						padding = { left = 1, right = 1 },
					},
					{
						"diff",
						symbols = {
							added = icons.git.added,
							modified = icons.git.modified,
							removed = icons.git.removed,
						},
						color = {
							added = { fg = colors.green },
							modified = { fg = colors.yellow },
							removed = { fg = colors.red },
						},
					},
					{
						"encoding",
						color = { fg = colors.cyan, bg = colors.gray2 },
						separator = { left = "", right = "" },
						padding = { left = 1, right = 1 },
					},
					{
						"fileformat",
						color = { fg = colors.magenta, bg = colors.gray2 },
						separator = { left = "", right = "" },
						padding = { left = 1, right = 1 },
					},
					{
						"filetype",
						color = { fg = colors.blue, bg = colors.gray2 },
						separator = { left = "", right = "" },
						padding = { left = 1, right = 1 },
					},
				},
				lualine_y = {
					{
						"progress",
						color = { fg = colors.fg, bg = colors.gray3 },
						separator = { left = "", right = "" },
						padding = { left = 1, right = 1 },
					},
					{
						"location",
						color = { fg = colors.fg, bg = colors.gray3 },
						separator = { left = "", right = "" },
						icon = " ",
						padding = { left = 1, right = 1 },
					},
				},
				lualine_z = {
					{
						function()
							return " " .. os.date("%R")
						end,
						color = { fg = colors.bg_dark, bg = colors.cyan },
						separator = { left = "", right = "" },
						padding = { left = 1, right = 1 },
					},
				},
			},
			winbar = {
				lualine_a = {},
				lualine_b = {
					{
						"filename",
						path = 1, -- Show relative path
						symbols = {
							modified = " ",
							readonly = " ",
							unnamed = "[No Name]",
						},
						color = { fg = colors.fg, bg = colors.gray1 },
						separator = { left = "", right = "" },
						padding = { left = 1, right = 1 },
					},
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_winbar = {
				lualine_a = {},
				lualine_b = {
					{
						"filename",
						path = 1,
						color = { fg = colors.subtext3, bg = colors.gray0 },
						separator = { left = "", right = "" },
						padding = { left = 1, right = 1 },
					},
				},
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
