return {
    'rcarriga/nvim-notify',
    dependencies = {
        'nvim-telescope/telescope.nvim',
    },
    opts = {
        top_down = false,
        render = 'minimal',
        stages = 'static',
    },
    keys = {
        { '<leader>n', '<cmd>Notifications<cr>', desc = 'Seach notification history', silent = true },
    },
}
