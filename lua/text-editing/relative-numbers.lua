local rlngroup = vim.api.nvim_create_augroup('RelativeLineNumbersConfig', {})

-- Disable relative line numbers on insert mode if enabled
vim.api.nvim_create_autocmd('InsertEnter', {
    group = rlngroup,
    callback = function()
        vim.g.relativenumber = vim.g.relativenumber or vim.opt.relativenumber:get()
        vim.opt.relativenumber = false
    end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
    group = rlngroup,
    callback = function() vim.opt.relativenumber = vim.g.relativenumber end,
})

-- Toggle relative line numbers
vim.api.nvim_create_user_command('ToggleRelativeLineNumbers', function()
    vim.g.relativenumber = (vim.g.relativenumber or vim.opt.relativenumber:get()) == false
    vim.opt.relativenumber = vim.g.relativenumber
    if vim.g.relativenumber then
        vim.notify('Toggled relative line numbers on')
    else
        vim.notify('Toggled relative line numbers off')
    end
end, {})
vim.cmd('cabbrev trl ToggleRelativeLineNumbers')
vim.keymap.set(
    'n',
    '<leader>tl',
    '<cmd>ToggleRelativeLineNumbers<cr>',
    { desc = 'Relative line numbers', silent = true }
)
