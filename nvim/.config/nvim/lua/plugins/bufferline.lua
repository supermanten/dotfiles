return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		highlights = {
			-- Consistent with lualine theme colors
			buffer_selected = {
				bold = true,
				italic = false,
				fg = "#e2e8f0", -- bright white
				bg = "#2a2a3e", -- gray2 from lualine
			},
			buffer_visible = {
				bold = true,
				italic = false,
				fg = "#94a3b8", -- subtext2
				bg = "#1a1a2e", -- gray1
			},
			buffer = {
				fg = "#64748b", -- subtext3
				bg = "#0f0f23", -- bg
			},
			modified = {
				fg = "#ffd43b", -- yellow
			},
			modified_selected = {
				fg = "#ffd43b", -- yellow
				bg = "#2a2a3e", -- gray2
			},
		},
		options = {
			indicator = {
				icon = "▎",
				style = "icon",
			},
			offsets = {
				{
					filetype = "neo-tree",
					text = "Neo-tree",
					highlight = "Directory",
					separator = true,
					padding = 1,
				},
			},
			diagnostics = "nvim_lsp",
			always_show_bufferline = true,
			diagnostics_indicator = function(_, _, diag)
				local icons = {
					Error = " ",
					Warn = " ",
					Hint = " ",
					Info = " ",
				}
				local ret = (diag.error and icons.Error .. diag.error .. " " or "")
					.. (diag.warning and icons.Warn .. diag.warning or "")
				return vim.trim(ret)
			end,
			mode = "buffers",
			buffer_close_icon = "󰅖", -- Custom close icon
			close_icon = "󰅙", -- Icon for closing all the tabs
			modified_icon = "●", -- Icon for modified buffers
			left_trunc_marker = "", -- Marker for left overflow
			right_trunc_marker = "", -- Marker for right overflow
			max_name_length = 18, -- Set a max buffer name length
			max_prefix_length = 15, -- Set a max prefix length for truncated buffers
			tab_size = 20, -- Set minimum tab size for buffers
			separator_style = "thick", -- Stylish separators (slant or thick)
			enforce_regular_tabs = true, -- Ensure all tabs are the same width
			color_icons = true,
			show_buffer_icons = true,
			show_buffer_close_icons = true,
			show_close_icon = true,
			show_tab_indicators = true,
			persist_buffer_sort = true, -- Keep custom sorting
		},
	},
}
