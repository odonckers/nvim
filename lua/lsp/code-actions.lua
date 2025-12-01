local cagroup = vim.api.nvim_create_augroup('CodeActionsConfig', {})

vim.api.nvim_create_autocmd('LspAttach', {
    group = cagroup,
    callback = function()
        vim.keymap.set(
            { 'n', 'x' },
            'gra',
            function() vim.lsp.buf.code_action() end,
            { desc = 'Quick fix', noremap = true }
        )
    end,
})
