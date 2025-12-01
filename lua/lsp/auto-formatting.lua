local afgroup = vim.api.nvim_create_augroup('AutoFormattingConfig', {})

-- Configure auto formatting for each buffer created
vim.api.nvim_create_autocmd('FileType', {
    group = afgroup,
    pattern = '*',
    callback = function()
        if vim.bo.filetype == 'json' then
            vim.b.autofmt = false
        else
            vim.b.autofmt = true
        end
    end,
})

-- Disable auto formatting for specific file types
vim.api.nvim_create_autocmd('FileType', {
    group = afgroup,
    pattern = { 'json', 'css', 'scss' },
    callback = function() vim.b.autofmt = false end,
})

-- Toggle auto formatting
vim.api.nvim_create_user_command('ToggleAutoFormatting', function()
    vim.b.autofmt = (vim.b.autofmt or false) == false
    if vim.b.autofmt then
        vim.notify('Toggled auto format on for this buffer')
    else
        vim.notify('Toggled auto format off for this buffer')
    end
end, {})
vim.cmd('cabbrev taf ToggleAutoFormatting')
vim.keymap.set('n', '<leader>tf', '<cmd>ToggleAutoFormatting<cr>', { desc = 'Auto formatting', silent = true })
