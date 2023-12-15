return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
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
          "**/.git/**",
        },
      },
    },
  },
}
