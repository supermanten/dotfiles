return {
	{
		"nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		version = false,
		dependencies = { "nvim-lua/plenary.nvim", "nvim-telescope/telescope-ui-select.nvim" },
		config = function()
			local actions = require("telescope.actions")
			local action_state = require("telescope.actions.state")

			require("telescope").setup({
				sort_mru = true,
				sort_lastused = true,
				ignore_current_buffer = true,
				pickers = {
					buffers = {
						sort_lastused = true,
						mappings = {
							i = {
								["<C-d>"] = actions.delete_buffer,
							},
							n = {
								["<C-d>"] = actions.delete_buffer,
							},
						},
					},
					find_files = {
						hidden = true,
						find_command = {
							"fd",
							"--type",
							"f",
							"--hidden",
							"--exclude",
							".git",
							"--exclude",
							"node_modules",
							"--exclude",
							".DS_Store",
						},
					},
					live_grep = {
						additional_args = function()
							return { "--hidden", "--glob", "!{.git,node_modules,.DS_Store}" }
						end,
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							winblend = 10,
							border = true,
							previewer = false,
						}),
					},
				},
				defaults = {
					initial_mode = "insert",
					prompt_prefix = "  ",
					selection_caret = "  ",
					multi_icon = " 󰄱 ",
					entry_prefix = "  ",
					path_display = {
						"truncate",
						shorten = { len = 3, exclude = { 1, -1 } },
					},
					file_ignore_patterns = {
						"node_modules",
						".git/",
						".DS_Store",
						"*.log",
						"*.tmp",
						"*.swp",
						"dist/",
						"build/",
						".next/",
						".nuxt/",
						".vuepress/",
					},
					sorting_strategy = "ascending",
					winblend = 10,
					border = true,
					borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0.55,
							results_width = 0.8,
						},
						vertical = {
							mirror = false,
						},
						width = 0.87,
						height = 0.80,
						preview_cutoff = 120,
					},
					mappings = {
						i = {
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-n>"] = actions.cycle_history_next,
							["<C-p>"] = actions.cycle_history_prev,
							["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
							["<C-l>"] = actions.complete_tag,
							["<C-_>"] = actions.which_key, -- keys from pressing <C-/>
							["<C-w>"] = { "<c-s-w>", type = "command" },
							["<C-h>"] = "which_key",
							["<esc>"] = actions.close,
						},
						n = {
							["q"] = actions.close,
							["<C-n>"] = actions.move_selection_next,
							["<C-p>"] = actions.move_selection_previous,
							["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
							["<C-c>"] = actions.close,
							["<C-j>"] = actions.move_selection_next,
							["<C-k>"] = actions.move_selection_previous,
							["<C-h>"] = "which_key",
						},
					},
					vimgrep_arguments = {
						"rg",
						"--color=never",
						"--no-heading",
						"--with-filename",
						"--line-number",
						"--column",
						"--smart-case",
						"--hidden",
						"--glob",
						"!{.git,node_modules,.DS_Store}",
					},
				},
			})

			-- Load extensions
			require("telescope").load_extension("ui-select")

			-- Custom functions for enhanced search
			local M = {}

			-- Search in current buffer directory
			M.find_files_cwd = function()
				require("telescope.builtin").find_files({
					cwd = vim.fn.expand("%:p:h"),
					hidden = true,
				})
			end

			-- Grep in current buffer directory
			M.live_grep_cwd = function()
				require("telescope.builtin").live_grep({
					cwd = vim.fn.expand("%:p:h"),
					additional_args = function()
						return { "--hidden", "--glob", "!{.git,node_modules,.DS_Store}" }
					end,
				})
			end

			-- Search for word under cursor
			M.grep_word_under_cursor = function()
				require("telescope.builtin").grep_string({
					search = vim.fn.expand("<cword>"),
					additional_args = function()
						return { "--hidden", "--glob", "!{.git,node_modules,.DS_Store}" }
					end,
				})
			end

			return M
		end,
	},
}
