-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set(
  "n",
  "<C-f>",
  ":!tmux neww ~/.config/nushell/scripts/tmux-session<CR>",
  { noremap = true, silent = false }
)
-- TODO: figure out why this is not working
vim.keymap.set("n", "<C-k>", ":!tmux neww kctx<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-f>", ":!tmux neww tmux-sessionizer<CR>", { noremap = true, silent = true })
