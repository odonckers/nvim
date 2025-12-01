-- Yank relative path to clipboard
vim.api.nvim_create_user_command('YankRelativePath', function()
    local path = vim.fn.fnamemodify(vim.fn.expand('%'), ':.')
    vim.fn.setreg('+', path)
    vim.notify("Yanked '" .. path .. "' to the clipboard")
end, {})
vim.cmd('cabbrev yrp YankRelativePath')
vim.keymap.set('n', 'ypr', '<cmd>YankRelativePath<cr>', { desc = 'Relative', silent = true })

-- Yank absolute path to clipboard
vim.api.nvim_create_user_command('YankAbsolutePath', function()
    local path = vim.fn.expand('%')
    vim.fn.setreg('+', path)
    vim.notify("Yanked '" .. path .. "' to the clipboard")
end, {})
vim.cmd('cabbrev yap YankAbsolutePath')
vim.keymap.set('n', 'ypa', '<cmd>YankAbsolutePath<cr>', { desc = 'Absolute', silent = true })
