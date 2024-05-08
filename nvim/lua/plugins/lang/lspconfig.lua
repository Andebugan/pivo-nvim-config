return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
        },
        config = function()
            local capabilities = require('cmp_nvim_lsp').default_capabilities()
            local lspconfig = require("lspconfig")

            vim.keymap.set('n', '<leader>df', vim.diagnostic.open_float)
            vim.keymap.set('n', '<leader>gp', vim.diagnostic.goto_prev)
            vim.keymap.set('n', '<leader>gn', vim.diagnostic.goto_next)
            vim.keymap.set('n', '<leader>sl', vim.diagnostic.setloclist)

            vim.api.nvim_create_autocmd('LspAttach', {
                group = vim.api.nvim_create_augroup('UserLspConfig', {}),
                callback = function(ev)
                    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                    local opts = { buffer = ev.buf }

                    vim.keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
                    vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
                    vim.keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
                    vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
                    vim.keymap.set('n', '<leader>s', vim.lsp.buf.signature_help, opts)
                    vim.keymap.set('n', '<leader>w', vim.lsp.buf.add_workspace_folder, opts)
                    vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
                    vim.keymap.set('n', '<leader>tD', vim.lsp.buf.type_definition, opts)
                    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
                    vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)
                    vim.keymap.set('n', '<leader>wl', function()
                        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                    end, opts)
                    vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, opts)
                    vim.keymap.set('n', '<leader>f', function()
                        vim.lsp.buf.format { async = true }
                    end, opts)
                end

            })
        end
    },
}
