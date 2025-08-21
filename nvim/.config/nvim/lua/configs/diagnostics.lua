-- Configure diagnostic display
vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	virtual_text = {
		prefix = " ",
		spacing = 1,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = " ",
			[vim.diagnostic.severity.WARN] = " ",
			[vim.diagnostic.severity.HINT] = " ",
			[vim.diagnostic.severity.INFO] = " ",
		},
	},
	underline = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
	},
})

-- Custom highlight groups for virtual text
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { fg = "#FF6C6B", bg = "#2E2E2E" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { fg = "#ECBE7B", bg = "#2E2E2E" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { fg = "#51AFEF", bg = "#2E2E2E" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { fg = "#98BE65", bg = "#2E2E2E" })

-- Toggle virtual text with <leader>dv
vim.keymap.set("n", "<leader>dv", function()
	local config = vim.diagnostic.config()
	vim.diagnostic.config({ virtual_text = not config.virtual_text })
end, { desc = "Toggle diagnostics virtual text" })

-- Toggle all diagnostics with <leader>dd
vim.keymap.set("n", "<leader>dd", function()
	local enabled = vim.diagnostic.is_enabled()
	if enabled then
		vim.diagnostic.enabled(false)
	else
		vim.diagnostic.enable()
	end
end, { desc = "Toggle all diagnostics" })

-- Auto show diagnostic float on hover
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, { focusable = false })
	end,
})
