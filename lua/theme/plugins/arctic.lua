return {
    'rockyzhang24/arctic.nvim',
    dependencies = { 'rktjmp/lush.nvim' },
    name = 'arctic',
    branch = 'v2',
    priority = 1000,
    config = function()
        vim.cmd.colorscheme('arctic')

        vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
        vim.api.nvim_set_hl(0, 'NormalNC', { bg = 'none' })

        -- vim.api.nvim_set_hl(0, 'NonText', { bg = 'none' })
        -- vim.api.nvim_set_hl(0, 'Pmenu', { bg = 'none' })
        -- vim.api.nvim_set_hl(0, 'EndOfBuffer', { bg = 'none' })
        -- vim.api.nvim_set_hl(0, 'FloatBorder', { bg = 'none' })
    end,
}
