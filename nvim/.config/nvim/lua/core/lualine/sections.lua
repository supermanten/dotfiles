-- File: lua/core/lualine/sections.lua

local colors = require("core.lualine.colors")
local icons = require("core.lualine.icons")
local lazy_status = require("lazy.status")

-- Define mode colors
local modecolor = {
	n = colors.blue,
	no = colors.blue,
	i = colors.green,
	ic = colors.green,
	v = colors.purple,
	[""] = colors.bright_purple,
	V = colors.purple,
	c = colors.orange,
	t = colors.bright_orange,
	R = colors.red,
	Rv = colors.bright_red,
	s = colors.magenta,
	S = colors.magenta,
	[""] = colors.bright_magenta,
	cv = colors.red,
	ce = colors.red,
	r = colors.cyan,
	rm = colors.cyan,
	["r?"] = colors.cyan,
	["!"] = colors.red,
}

local M = {
	lualine_a = {
		{
			"mode",
			color = function()
				return { bg = modecolor[vim.fn.mode()], fg = colors.bg_dark, gui = "bold" }
			end,
			separator = { left = "", right = "" },
			icon = " ",
			padding = { left = 1, right = 1 },
		},
	},
	lualine_b = {
		{
			function()
				return " "
			end,
			color = { bg = colors.bg_dark, fg = colors.blue },
		},
		{
			"branch",
			icon = " ",
			color = { bg = colors.gray3, fg = colors.green, gui = "bold" },
			separator = { left = "", right = "" },
			padding = { left = 1, right = 1 },
		},
	},
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
			color = { fg = colors.blue },
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
			symbols = { added = icons.git.added, modified = icons.git.modified, removed = icons.git.removed },
			color = { added = { fg = colors.green }, modified = { fg = colors.yellow }, removed = { fg = colors.red } },
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
	winbar = {
		lualine_a = {},
		lualine_b = {
			{
				"filename",
				path = 1,
				symbols = { modified = " ", readonly = " ", unnamed = "[No Name]" },
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
}

return M
