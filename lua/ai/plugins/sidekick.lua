return {
    'folke/sidekick.nvim',
    enabled = false,
    dependencies = {
        {
            'zbirenbaum/copilot.lua',
            cmd = 'Copilot',
            event = 'InsertEnter',
            opts = {
                suggestion = { enabled = false },
                panel = { enabled = false },
            },
            config = function(_, opts)
                -- blink.cmp
                vim.api.nvim_create_autocmd('User', {
                    pattern = 'BlinkCmpMenuOpen',
                    callback = function() vim.b.copilot_suggestion_hidden = true end,
                })
                vim.api.nvim_create_autocmd('User', {
                    pattern = 'BlinkCmpMenuClose',
                    callback = function() vim.b.copilot_suggestion_hidden = false end,
                })

                require('copilot').setup(opts)
            end,
        },
    },
    opts = {
        cli = {
            win = {
                layout = 'float',
                float = {
                    width = 0.55,
                    height = 0.85,
                    border = 'rounded',
                },
            },
        },
    },
    keys = {
        {
            '<leader>.',
            function() require('sidekick.cli').prompt() end,
            mode = { 'n', 'x' },
            desc = 'Sidekick Select Prompt',
        },
        {
            '<C-.>',
            function() require('sidekick.cli').focus() end,
            mode = { 'n', 'i', 't' },
            desc = 'Sidekick Switch Focus',
        },
        {
            '<C-.>',
            function() require('sidekick.cli').send({ msg = '{selection}' }) end,
            mode = { 'x' },
            desc = 'Send Visual Selection',
        },
        {
            '<C-S-.>',
            function() require('sidekick.cli').send({ msg = '{this}' }) end,
            mode = { 'n', 'x' },
            desc = 'Send This',
        },
        {
            '<leader>sa',
            function() require('sidekick').nes_jump_or_apply() end,
            desc = 'Apply suggestion (or jump to if none)',
        },
        { '<leader>sj', function() require('sidekick.nes').jump() end, desc = 'Jump to the next suggestion' },
        { '<leader>sr', function() require('sidekick.nes').have() end, desc = 'Reload suggestions in buffer' },
        { '<leader>ta', function() require('sidekick.nes').toggle() end, desc = 'Copilot suggestions', silent = true },
    },
}
