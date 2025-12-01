return {
    'folke/which-key.nvim',
    lazy = false,
    opts = {
        preset = 'helix', -- 'classic' | 'modern' | 'helix'
        spec = {
            { '<leader>a', group = 'AI', mode = { 'n', 'v' } },
            { '<leader>d', group = 'Diagnostics' },
            { '<leader>g', group = 'Git' },
            { '<leader>s', group = 'Code Suggestions', mode = { 'n', 'v' } },
            { '<leader>t', group = 'Toggle' },
        },
    },
    config = function(_, opts) require('which-key').setup(opts) end,
}
