vim.api.nvim_create_user_command('Format', function(args)
    local range = nil
    if args.count ~= -1 then
        local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
        range = {
            start = { args.line1, 0 },
            ['end'] = { args.line2, end_line:len() },
        }
    end
    require('conform').format({ async = true, lsp_format = 'never', range = range })
end, { range = true })

return {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    opts = {
        formatters_by_ft = {
            lua = { 'stylua' },
            bash = { 'shfmt' },
            shell = { 'shfmt' },
            sh = { 'shfmt' },
            javascript = { 'eslint_d' },
            typescript = { 'eslint_d' },
            htmlangular = { 'eslint_d' },
            go = { 'goimports', 'gofmt' },
        },
        format_on_save = function(bufnr)
            local ignore_filetypes = { 'sql' }

            if vim.tbl_contains(ignore_filetypes, vim.bo[bufnr].filetype) then return end
            if vim.b.autofmt == false then return end

            local bufname = vim.api.nvim_buf_get_name(bufnr)
            if bufname:match('/node_modules/') then return end

            return { timeout_ms = 500, lsp_format = 'never' }
        end,
    },
    keys = {
        { '<leader>f', '<cmd>Format<cr>', desc = 'Format' },
    },
}
