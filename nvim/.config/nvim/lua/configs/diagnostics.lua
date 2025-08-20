vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	virtual_text = {
		prefix = "» ",
		virt_text_hide = false,
		spacing = 1,
	},
	signs = true,
	underline = true,
	float = false,
})
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextError", { link = "LspDiagnosticsVirtualTextError" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { link = "LspDiagnosticsVirtualTextWarn" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { link = "LspDiagnosticsVirtualTextInfo" })
vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { link = "LspDiagnosticsVirtualTextHint" })
vim.keymap.set("n", "<leader>dv", function()
	local config = vim.diagnostic.config()
	vim.diagnostic.config({ virtual_text = not config.virtual_text })
end, { desc = "Toggle diagnostics virtual text" })
