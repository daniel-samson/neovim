--[[
-- Modern Text Editor Features
--]]
-- Selection
vim.api.nvim_set_keymap('n', '<S-Up>', '<S-v>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Up>', '<S-v>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Up>', 'k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Down>', '<S-v>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Down>', '<S-v>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Down>', 'j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Left>', '<S-v>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Left>', '<S-v>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Left>', 'h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Right>', '<S-v>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<S-Right>', '<S-v>l', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-Right>', 'l', { noremap = true, silent = true })
-- Indentation
vim.api.nvim_set_keymap('n', '<TAB>', '>>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', '<<', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<TAB>', '>gv', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-TAB>', '<gv', { noremap = true, silent = true })
-- Duplicate Line
vim.api.nvim_set_keymap('n', '<LEADER>d', 'Yp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<LEADER>d', '<Esc>Yp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<LEADER>d', '<Esc>Yp', { noremap = true, silent = true })
-- Move Line
vim.api.nvim_set_keymap('n', '<LEADER>k', 'ddkkp', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<LEADER>j', 'ddjjp', { noremap = true, silent = true })
-- Create New Line when press return
vim.api.nvim_set_keymap('n', '<Enter>', 'o', { noremap = true, silent = true })
-- Delete character from normal mode
vim.api.nvim_set_keymap('n', '<BS>', 'i<BS>', { noremap = true, silent = true })
