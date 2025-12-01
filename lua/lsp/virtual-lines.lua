-- Toggle virtual lines
vim.api.nvim_create_user_command('ToggleVirtualLines', function()
    local virtuallines = (vim.g.virtual_lines or false) == false
    vim.g.virtual_lines = virtuallines

    local opts = {}
    if virtuallines then
        opts.virtual_lines = { current_line = true }
        opts.virtual_text = false
        vim.notify('Toggled virtual lines on')
    else
        opts.virtual_lines = false
        opts.virtual_text = { current_line = true }
        vim.notify('Toggled virtual lines off')
    end
    vim.diagnostic.config(opts)
end, {})
vim.cmd('cabbrev tvl ToggleVirtualLines')
vim.keymap.set('n', '<leader>tv', '<cmd>ToggleVirtualLines<cr>', { desc = 'Virtual lines', silent = true })
