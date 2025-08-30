return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		-- Set header
		dashboard.section.header.val = {

			"                                                           ",
			"   ██████╗ ██╗███╗   ██╗██████╗ ███████╗███████╗██╗  ██╗   ",
			"   ██╔══██╗██║████╗  ██║██╔══██╗██╔════╝██╔════╝██║  ██║   ",
			"   ██████╔╝██║██╔██╗ ██║██║  ██║█████╗  ███████╗███████║   ",
			"   ██╔══██╗██║██║╚██╗██║██║  ██║██╔══╝  ╚════██║██╔══██║   ",
			"   ██████╔╝██║██║ ╚████║██████╔╝███████╗███████║██║  ██║   ",
			"   ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝╚══════╝╚═╝  ╚═╝   ",
			"                                                           ",
		}

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("n", "  > New File", "<cmd>enew<CR>"),
			dashboard.button("SPC e", "  > Toggle file explorer", "<cmd>Neotree filesystem reveal left<CR>"),
			dashboard.button("SPC fp", "󰱼  > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fg", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("u", "󰚰  Update Plugins", "<cmd>Lazy sync<CR>"),
			dashboard.button("l", "󰒲  >" .. " Lazy", "<cmd> Lazy <cr>"),
			dashboard.button("m", "󰠅  >" .. " Mason", "<cmd> Mason <cr>"),
			dashboard.button("q", "  > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Set highlights for catppuccin integration
		dashboard.section.header.opts.hl = "AlphaHeader"
		dashboard.section.buttons.opts.hl = "AlphaButtons"
		dashboard.section.footer.opts.hl = "AlphaFooter"

		-- Define highlight groups
		vim.api.nvim_set_hl(0, "AlphaHeader", { fg = "#89b4fa", bold = true })
		vim.api.nvim_set_hl(0, "AlphaButtons", { fg = "#f38ba8" })
		vim.api.nvim_set_hl(0, "AlphaFooter", { fg = "#a6e3a1", italic = true })

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		vim.api.nvim_create_autocmd("User", {
			once = true,
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				dashboard.section.footer.val = " Neovim loaded "
					.. stats.loaded
					.. "/"
					.. stats.count
					.. " plugins in "
					.. ms
					.. "ms"
				pcall(vim.cmd.AlphaRedraw)
			end,
		})

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
