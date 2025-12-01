return {
    'mason-org/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
        {
            'mason-org/mason.nvim',
            opts = {
                registries = {
                    'github:mason-org/mason-registry',
                    'github:Crashdummyy/mason-registry',
                },
                ui = { border = 'rounded' },
            },
            keys = {
                { '<leader>m', '<cmd>Mason<cr>', desc = 'Open mason', silent = true },
            },
        },
        'neovim/nvim-lspconfig',
        { 'antosha417/nvim-lsp-file-operations', config = true },
    },
    opts = {
        ensure_installed = {
            'lua_ls',
            'html',
            'cssls',
            'ts_ls',
            'eslint',
            'jsonls',
            'phpactor',
            'graphql',

            -- Install manually
            -- 'roslyn', -- part of a separate mason registry
            -- 'angularls', -- Pattern uses v19
        },
    },
    config = function(_, opts)
        require('mason-lspconfig').setup(opts)

        -- lua_ls
        vim.lsp.config('lua_ls', {
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name
                    if
                        path ~= vim.fn.stdpath('config')
                        ---@diagnostic disable-next-line: undefined-field
                        and (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                    then
                        return
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        version = 'LuaJIT',
                        path = { 'lua/?.lua', 'lua/?/init.lua' },
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = { vim.env.VIMRUNTIME },
                    },
                })
            end,
            settings = {
                Lua = {},
            },
        })

        -- angularls
        vim.lsp.enable('angularls')
        vim.lsp.config('angularls', {})
        -- require('lspconfig').angularls.setup({})
    end,
}
