return {
	{
		"nvim-neo-tree/neo-tree.nvim",
		opts = {
			event_handlers = {
				{
					event = "neo_tree_buffer_enter",
					handler = function(arg)
						vim.cmd([[
              setlocal relativenumber
            ]])
					end,
				},
			},
			window = {
				position = "current", -- set window position to full
			},
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					-- hide_gitignored = true,
				},
				-- TODO: figure out why this is not working
				never_show_by_pattern = { -- uses glob style patterns
					"**/.git/**/*",
				},
			},
		},
	},
}
