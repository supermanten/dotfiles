local map = vim.keymap.set

-- ## UI & Appearance Controls
-- Toggle high-contrast mode
vim.api.nvim_create_user_command("ToggleContrast", function()
	local current = vim.g.high_contrast or false
	if current then
		vim.cmd("colorscheme catppuccin")
		vim.g.high_contrast = false
	else
		vim.cmd("hi Normal guibg=#000000 guifg=#ffffff")
		vim.cmd("hi Comment guifg=#888888")
		vim.g.high_contrast = true
	end
end, {})

map("n", "<leader>hc", "<cmd>ToggleContrast<CR>", { desc = "Toggle High Contrast" })

-- ## Performance Monitoring
map("n", "<leader>ps", "<cmd>Lazy profile<CR>", { desc = "Profile plugin startup time" })
map("n", "<leader>pl", "<cmd>Lazy log<CR>", { desc = "Show Lazy logs" })
map("n", "<leader>ph", "<cmd>Lazy health<CR>", { desc = "Check plugin health" })
map("n", "<leader>pm", "<cmd>messages<CR>", { desc = "Show recent messages" })
map("n", "<leader>pt", function()
	local stats = require("lazy").stats()
	local ms = math.floor(stats.startuptime * 100 + 0.5) / 100
	vim.notify(
		string.format("⚡ Neovim loaded %d/%d plugins in %s ms", stats.loaded, stats.count, ms),
		vim.log.levels.INFO
	)
end, { desc = "Show startup time" })

-- ## Quality of Life Improvements
-- Better search
map("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Line operations
map("n", "<leader>cl", "<cmd>center<CR>", { desc = "Center current line" })
map("n", "<leader>zt", "<cmd>normal! zt<CR>", { desc = "Top current line" })
map("n", "<leader>zz", "<cmd>normal! zz<CR>", { desc = "Center current line" })
map("n", "<leader>zb", "<cmd>normal! zb<CR>", { desc = "Bottom current line" })

-- Quick commands
map("n", "<leader>cd", "<cmd>cd %:p:h<CR><cmd>pwd<CR>", { desc = "Change to current file directory" })
map(
	"n",
	"<leader>cp",
	"<cmd>let @+ = expand('%:p')<CR><cmd>echo 'Copied: ' . @+<CR>",
	{ desc = "Copy current file path" }
)
map(
	"n",
	"<leader>cP",
	"<cmd>let @+ = expand('%:p:h')<CR><cmd>echo 'Copied: ' . @+<CR>",
	{ desc = "Copy current file directory" }
)

-- Quick access to important files
local builtin = require("telescope.builtin")
map("n", "<leader>mn", function()
	builtin.find_files({ cwd = "~/.config/nvim" })
end, { desc = "Edit Neovim Config" })
map("n", "<leader>mz", function()
	builtin.find_files({ cwd = "~" })
end, { desc = "Edit Zsh Config" })

