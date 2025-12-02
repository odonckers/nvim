return {
    'aserowy/tmux.nvim',
    opts = {
        navigation = { enable_default_keybindings = false },
        resize = {
            enable_default_keybindings = false,
            resize_step_x = 5,
            resize_step_y = 5,
        },
        swap = { enable_default_keybindings = false },
    },
    config = function(_, opts) return require('tmux').setup(opts) end,
    keys = {
        -- Navigation
        {
            '<C-h>',
            function() require('tmux').move_left() end,
            { desc = 'Navigate left', silent = true },
        },
        {
            '<C-l>',
            function() require('tmux').move_right() end,
            { desc = 'Navigate right', silent = true },
        },
        {
            '<C-j>',
            function() require('tmux').move_bottom() end,
            { desc = 'Navigate down', silent = true },
        },
        {
            '<C-k>',
            function() require('tmux').move_top() end,
            { desc = 'Navigate up', silent = true },
        },

        -- Resize
        {
            '<C-left>',
            function() require('tmux').resize_left() end,
            { desc = 'Resize left', silent = true },
        },
        {
            '<C-right>',
            function() require('tmux').resize_right() end,
            { desc = 'Resize right', silent = true },
        },
        {
            '<C-down>',
            function() require('tmux').resize_bottom() end,
            { desc = 'Resize down', silent = true },
        },
        {
            '<C-up>',
            function() require('tmux').resize_top() end,
            { desc = 'Resize up', silent = true },
        },

        -- Swap
        {
            '<C-S-left>',
            function() require('tmux').swap_left() end,
            { desc = 'Swap left', silent = true },
        },
        {
            '<C-S-right>',
            function() require('tmux').swap_right() end,
            { desc = 'Swap right', silent = true },
        },
        {
            '<C-S-down>',
            function() require('tmux').swap_bottom() end,
            { desc = 'Swap down', silent = true },
        },
        {
            '<C-S-up>',
            function() require('tmux').swap_top() end,
            { desc = 'Swap up', silent = true },
        },
    },
}
