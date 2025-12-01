-- Toggle spell check
vim.api.nvim_create_user_command('ToggleSpellCheck', function()
    ---@diagnostic disable-next-line: undefined-field
    vim.opt_local.spell = (vim.opt_local.spell:get() or false) == false
    if vim.opt_local.spell then
        vim.notify('Toggled spell check on for this buffer')
    else
        vim.notify('Toggled spell check off for this buffer')
    end
end, {})
vim.cmd('cabbrev tsc ToggleSpellCheck')
vim.keymap.set('n', '<leader>ts', '<cmd>ToggleSpellCheck<cr>', { desc = 'Spell check', silent = true })
