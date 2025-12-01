-- Toggle word wrap
vim.api.nvim_create_user_command('ToggleWordWrap', function()
    ---@diagnostic disable-next-line: undefined-field
    vim.opt_local.wrap = (vim.opt_local.wrap:get() or false) == false
    if vim.opt_local.wrap then
        vim.notify('Toggled word wrap on for this buffer')
    else
        vim.notify('Toggled word wrap off for this buffer')
    end
end, {})
vim.cmd('cabbrev tww ToggleWordWrap')
vim.keymap.set('n', '<leader>tw', '<cmd>ToggleWordWrap<cr>', { desc = 'Word wrap', silent = true })
