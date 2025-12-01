local termgroup = vim.api.nvim_create_augroup('TermConfig', {})

-- Disable line numbers in terminal
vim.api.nvim_create_autocmd('TermOpen', {
    group = termgroup,
    callback = function()
        vim.opt_local.number = false
        vim.opt_local.relativenumber = false
        vim.opt_local.signcolumn = 'no'
    end,
})
