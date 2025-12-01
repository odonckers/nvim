return {
    'gbprod/yanky.nvim',
    config = true,
    keys = {
        { 'p', '<Plug>(YankyPutAfter)', mode = { 'n', 'x' } },
        { 'P', '<Plug>(YankyPutBefore)', mode = { 'n', 'x' } },
        { 'gp', '<Plug>(YankyGPutAfter)', mode = { 'n', 'x' } },
        { 'gP', '<Plug>(YankyGPutBefore)', mode = { 'n', 'x' } },
        {
            '<leader>p',
            function()
                local theme = require('telescope.themes').get_cursor({
                    layout_config = {
                        width = 0.7,
                        height = 0.15,
                    },
                })
                require('telescope').extensions.yank_history.yank_history(theme)
            end,
            mode = { 'n', 'x' },
            desc = 'Yank history',
        },
    },
}
