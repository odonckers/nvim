local dark_red = '#d16969'
local yellow_orange = '#d7ba7d'
local light_blue = '#9cdcfe'
local cornflower_blue = '#6796e6'
local dark_pink = '#c586c0'
local purple = '#ae81ff'

local white = '#ffffff'
local gray4 = '#9d9d9d'
local black = '#2d2d2d'
local black2 = '#252526'

local arctic_theme = {
    normal = {
        a = { bg = cornflower_blue, fg = black, gui = 'bold' },
        b = { bg = black, fg = gray4 },
        c = { bg = black2, fg = gray4 },
    },
    insert = {
        a = { fg = black, bg = light_blue },
    },
    visual = {
        a = { fg = black, bg = yellow_orange },
    },
    replace = {
        a = { fg = black, bg = dark_red },
    },
    command = {
        a = { fg = black, bg = gray4 },
    },
    terminal = {
        a = { fg = black, bg = purple },
    },
    pending = {
        a = { fg = white, bg = dark_pink },
    },
    inactive = {
        a = { fg = white, bg = black },
    },
}

return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            theme = arctic_theme,
            section_separators = { left = '', right = '' },
            component_separators = { left = '∙', right = '∙' },
        },
        sections = {
            lualine_a = {
                { 'mode', separator = { left = '', right = '' } },
            },
            lualine_b = { 'branch', 'diff' },
            lualine_c = { { 'filename', path = 1 }, 'diagnostics' },
            lualine_x = { 'filetype' },
            lualine_y = { 'progress' },
            lualine_z = {
                { 'location', separator = { left = '', right = '' } },
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
                { 'filename', path = 1 },
                { 'diagnostics' },
            },
            lualine_x = { 'filetype' },
            lualine_y = {},
            lualine_z = {},
        },
    },
    config = function(_, opts)
        -- vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'none' })
        require('lualine').setup(opts)
    end,
}
