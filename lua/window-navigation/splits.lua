-- Split window
vim.keymap.set('n', '<C-w>-', '<cmd>split<cr>', { desc = 'Split window', silent = true })
vim.keymap.set('n', '<C-w>_', '<cmd>vsplit<cr>', { desc = 'Split window vertically', silent = true })

-- Navigate splits
-- vim.keymap.set({ 'n', 't' }, '<C-h>', '<cmd>wincmd h<cr>', { desc = 'Navigate left', silent = true })
-- vim.keymap.set({ 'n', 't' }, '<C-l>', '<cmd>wincmd l<cr>', { desc = 'Navigate right', silent = true })
-- vim.keymap.set({ 'n', 't' }, '<C-j>', '<cmd>wincmd j<cr>', { desc = 'Navigate down', silent = true })
-- vim.keymap.set({ 'n', 't' }, '<C-k>', '<cmd>wincmd k<cr>', { desc = 'Navigate up', silent = true })

-- Resize splits
-- vim.keymap.set({ 'n', 't' }, '<C-left>', '<cmd>vertical resize -5<cr>', { desc = 'Width [-]', silent = true })
-- vim.keymap.set({ 'n', 't' }, '<C-right>', '<cmd>vertical resize +5<cr>', { desc = 'Width [+]', silent = true })
-- vim.keymap.set({ 'n', 't' }, '<C-down>', '<cmd>resize +5<cr>', { desc = 'Height [+]', silent = true })
-- vim.keymap.set({ 'n', 't' }, '<C-up>', '<cmd>resize -5<cr>', { desc = 'Height [-]', silent = true })

-- Swap splits
-- vim.keymap.set('n', '<C-S-left>', '<C-w>H', { desc = 'Swap left', silent = true })
-- vim.keymap.set('n', '<C-S-right>', '<C-w>L', { desc = 'Swap right', silent = true })
-- vim.keymap.set('n', '<C-S-down>', '<C-w>J', { desc = 'Swap bottom', silent = true })
-- vim.keymap.set('n', '<C-S-up>', '<C-w>K', { desc = 'Swap top', silent = true })
