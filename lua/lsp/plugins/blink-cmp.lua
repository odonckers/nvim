return {
    'saghen/blink.cmp',
    dependencies = {
        'rafamadriz/friendly-snippets',
        'fang2hou/blink-copilot',
        'ribru17/blink-cmp-spell',
    },
    version = '1.*',
    opts = {
        keymap = {
            preset = 'enter',
            ['<Tab>'] = {
                'snippet_forward',
                function() return require('sidekick').nes_jump_or_apply() end,
                'fallback',
            },
        },
        completion = {
            menu = { border = 'single' },
            documentation = {
                auto_show = true,
                window = { border = 'single' },
            },
        },
        signature = {
            window = { border = 'single' },
        },
        sources = {
            default = {
                'lsp',
                'copilot',
                'path',
                'snippets',
                'spell',
                'buffer',
            },
            providers = {
                copilot = {
                    name = 'copilot',
                    module = 'blink-copilot',
                    score_offset = 100,
                    async = true,
                },
                spell = {
                    name = 'Spell',
                    module = 'blink-cmp-spell',
                    opts = {
                        enable_in_context = function()
                            local curpos = vim.api.nvim_win_get_cursor(0)
                            local captures = vim.treesitter.get_captures_at_pos(0, curpos[1] - 1, curpos[2] - 1)
                            local in_spell_capture = false
                            for _, cap in ipairs(captures) do
                                if cap.capture == 'spell' then
                                    in_spell_capture = true
                                elseif cap.capture == 'nospell' then
                                    return false
                                end
                            end
                            return in_spell_capture
                        end,
                    },
                },
            },
            -- fuzzy = {
            --     sorts = {
            --         function(a, b)
            --             local sort = require('blink.cmp.fuzzy.sort')
            --             if a.source_id == 'spell' and b.source_id == 'spell' then return sort.label(a, b) end
            --         end,
            --         'score',
            --         'kind',
            --         'label',
            --     },
            -- },
        },
    },
}
