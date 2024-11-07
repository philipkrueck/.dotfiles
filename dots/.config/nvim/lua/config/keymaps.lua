-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true })

vim.keymap.set("n", "<C-f>", ":!tmux neww tmux_session<CR>", { noremap = true, silent = true })
-- vim.keymap.set("n", "<C-f>", ":!tmux neww tmux-sessionizer<CR>", { noremap = true, silent = true })
