return {
    'ibhagwan/fzf-lua',
    opts = {
        previewers = {
            builtin = {
                -- fzf-lua is very fast, but it really struggled to preview a couple files
                -- in a repo. Those files were very big JavaScript files (1MB, minified, all on a single line).
                -- It turns out it was Treesitter having trouble parsing the files.
                -- With this change, the previewer will not add syntax highlighting to files larger than 100KB
                -- (Yes, I know you shouldn't have 100KB minified files in source control.)
                syntax_limit_b = 1024 * 100, -- 100KB
            },
        },
        winopts = {
            width = 0.5,
            preview = {
                layout = 'vertical',
            },
        },
        oldfiles = {
            -- In Telescope, when I used <leader>fr, it would load old buffers.
            -- fzf lua does the same, but by default buffers visited in the current
            -- session are not included. I use <leader>fr all the time to switch
            -- back to buffers I was just in. If you missed this from Telescope,
            -- give it a try.
            include_current_session = true,
        },
        grep = {
            -- One thing I missed from Telescope was the ability to live_grep and the
            -- run a filter on the filenames.
            -- Ex: Find all occurrences of "enable" but only in the "plugins" directory.
            -- With this change, I can sort of get the same behaviour in live_grep.
            -- ex: > enable --*/plugins/*
            -- I still find this a bit cumbersome. There's probably a better way of doing this.
            rg_glob = true, -- enable glob parsing
            glob_flag = '--iglob', -- case insensitive globs
            glob_separator = '%s%-%-', -- query separator pattern (lua): ' --'
        },
    },
    keys = function()
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserFzfLuaLspConfig', {}),
            callback = function(ev)
                vim.keymap.set('n', 'gd', vim.diagnostic.open_float, { desc = 'Line diangostics', buffer = ev.buf })
                vim.keymap.set(
                    'n',
                    'grd',
                    function() require('fzf-lua').lsp_definitions() end,
                    { desc = 'Definitions', buffer = ev.buf, silent = true }
                )
                vim.keymap.set('n', 'grD', vim.lsp.buf.declaration, { desc = 'Decleration', buffer = ev.buf })
                vim.keymap.set(
                    'n',
                    'gri',
                    function() require('fzf-lua').lsp_implementations() end,
                    { desc = 'Implementations', buffer = ev.buf, silent = true }
                )
                vim.keymap.set(
                    'n',
                    'grr',
                    function() require('fzf-lua').lsp_references() end,
                    { desc = 'References', buffer = ev.buf, silent = true }
                )
                vim.keymap.set(
                    'n',
                    'grt',
                    function() require('fzf-lua').lsp_typedefs() end,
                    { desc = 'Type definitions', buffer = ev.buf, silent = true }
                )

                -- Diagnostics
                vim.keymap.set(
                    'n',
                    '<leader>dd',
                    function() require('fzf-lua').diagnostics_document() end,
                    { desc = 'Search in document', silent = true }
                )
                vim.keymap.set(
                    'n',
                    '<leader>dw',
                    function() require('fzf-lua').diagnostics_workspace() end,
                    { desc = 'Search in workspace', silent = true }
                )
            end,
        })

        return {
            { '<leader><leader>', '<cmd>FzfLua files<cr>', desc = 'Files FZF', silent = true },
            { '<leader>e', '<cmd>FzfLua oldfiles<cr>', desc = 'Search old files', silent = true },
            { '<leader>j', '<cmd>FzfLua jumps<cr>', desc = 'Search jumplist', silent = true },
            { '<leader>r', '<cmd>FzfLua resume<cr>', desc = 'Resume last open FZF', silent = true },
            { '<leader>q', '<cmd>FzfLua quickfix<cr>', desc = 'Quick fix', silent = true },
            { '<leader>`', '<cmd>FzfLua marks<cr>', desc = 'Search marks', silent = true },
            { '<leader>@', '<cmd>FzfLua lsp_document_symbols<cr>', desc = 'Search symbols', silent = true },
            { '<leader>/', '<cmd>FzfLua live_grep<cr>', desc = 'Search file contents', silent = true },
            {
                '<leader>?',
                '<cmd>FzfLua grep_cword<cr>',
                desc = 'Search file content for word under cursor',
                silent = true,
            },
        }
    end,
}
