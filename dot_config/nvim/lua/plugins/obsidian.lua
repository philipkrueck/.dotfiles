return {
	"epwalsh/obsidian.nvim",
	version = "*", -- recommended, use latest release instead of latest commit
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required dependency
	},
	opts = {
		workspaces = {
			{
				name = "Brain",
				path = "~/Library/Mobile Documents/iCloud~md~obsidian/Documents/Brain",
			},
		},
	},
}
