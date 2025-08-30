return {
	"akinsho/bufferline.nvim",
	event = "VeryLazy",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	version = "*",
	opts = {
		highlights = {
			buffer_selected = {
				bold = true,
				italic = false,
			},
			buffer_visible = {
				bold = true,
				italic = false,
			},
		},
		options = {
			indicator = {
				icon = "🔥",
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
					Error = "❌ ",
					Warn = "⚠️ ",
					Hint = "💡 ",
					Info = "ℹ️ ",
				}
				local ret = (diag.error and icons.Error .. diag.error .. " " or "")
					.. (diag.warning and icons.Warn .. diag.warning or "")
				return vim.trim(ret)
			end,
			mode = "buffers",
			buffer_close_icon = "❌", -- Custom close icon
			close_icon = "🚪", -- Icon for closing all the tabs
			modified_icon = "✏️", -- Icon for modified buffers
			left_trunc_marker = "⬅️", -- Marker for left overflow
			right_trunc_marker = "➡️", -- Marker for right overflow
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
