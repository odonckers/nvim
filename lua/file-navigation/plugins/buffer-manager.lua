return {
    'j-morano/buffer_manager.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
        width = 0.5,
        height = 0.3,
        highlight = 'Normal:FloatBorder',
    },
    keys = {
        { '<tab>', function() require('buffer_manager.ui').nav_next() end, desc = 'Next buffer' },
        { '<S-tab>', function() require('buffer_manager.ui').nav_prev() end, desc = 'Previous buffer' },
        {
            '<leader><tab>',
            function() require('buffer_manager.ui').toggle_quick_menu() end,
            desc = 'Explore buffers',
        },
    },
}
