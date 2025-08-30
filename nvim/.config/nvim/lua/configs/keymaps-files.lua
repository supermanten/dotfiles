local map = vim.keymap.set

-- ## File and Buffer Management
-- Grouped under leader + f (for 'file') and leader + b (for 'buffer')
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New File" })
map("n", "<C-s>", "<cmd>w<cr>", { desc = "Save File" })
map("i", "<C-s>", "<cmd>w<cr>", { desc = "Save File" })
map("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save File" })
map("n", "<leader>fS", "<cmd>wa<cr>", { desc = "Save All Files" })
map("n", "<leader>fa", "<cmd>wqa<cr>", { desc = "Save All and Quit" })
map("n", "<leader>qq", "<cmd>qa<cr>", { desc = "Quit All" })
map("n", "<leader>qQ", "<cmd>qa!<cr>", { desc = "Force Quit All" })

-- Buffer navigation
map("n", "<leader>bn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bp", "<cmd>bprevious<cr>", { desc = "Previous Buffer" })
map("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
map("n", "<leader>bD", "<cmd>bdelete!<cr>", { desc = "Force Delete Buffer" })
map("n", "<leader>bc", "<cmd>%bd|e#<cr>", { desc = "Close Other Buffers" })

-- Neo Tree - Enhanced File Navigation
map("n", "<leader>e", function()
	local ok, _ = pcall(vim.cmd, "Neotree toggle")
	if not ok then
		vim.notify("Neo-tree not available", vim.log.levels.WARN)
	end
end, { desc = "Toggle File Explorer" })

map("n", "<leader>E", function()
	local ok, _ = pcall(vim.cmd, "Neotree focus")
	if not ok then
		vim.notify("Neo-tree not available", vim.log.levels.WARN)
	end
end, { desc = "Focus File Explorer" })

map("n", "<leader>be", function()
	local ok, _ = pcall(vim.cmd, "Neotree buffers reveal float")
	if not ok then
		vim.notify("Neo-tree buffers not available", vim.log.levels.WARN)
	end
end, { desc = "Buffer Explorer" })

map("n", "<leader>gs", function()
	local ok, _ = pcall(vim.cmd, "Neotree git_status reveal float")
	if not ok then
		vim.notify("Neo-tree git status not available", vim.log.levels.WARN)
	end
end, { desc = "Git Status Explorer" })

map("n", "<leader>fe", function()
	local ok, _ = pcall(vim.cmd, "Neotree filesystem reveal left")
	if not ok then
		vim.notify("Neo-tree filesystem not available", vim.log.levels.WARN)
	end
end, { desc = "Filesystem Explorer" })

-- Quick file operations
map("n", "<leader>nf", function()
	local ok, _ = pcall(vim.cmd, "Neotree filesystem reveal left")
	if not ok then
		vim.notify("Neo-tree filesystem not available", vim.log.levels.WARN)
	end
end, { desc = "Reveal Current File" })

map("n", "<leader>nc", function()
	local ok, _ = pcall(vim.cmd, "Neotree close")
	if not ok then
		vim.notify("Neo-tree close not available", vim.log.levels.WARN)
	end
end, { desc = "Close Neo-tree" })

map("n", "<leader>nr", function()
	local ok, _ = pcall(vim.cmd, "Neotree refresh")
	if not ok then
		vim.notify("Neo-tree refresh not available", vim.log.levels.WARN)
	end
end, { desc = "Refresh Neo-tree" })

-- BufferLine
map("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
map("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous Buffer" })
map("n", "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", { desc = "Toggle Pin" })
map("n", "<leader>bo", "<Cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Delete Non-Pinned Buffers" })
map("n", "<leader>bc", "<Cmd>BufferLineCloseRight<CR>", { desc = "Delete Buffers to the Right" })