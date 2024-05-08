return {
    {
        "williamboman/mason.nvim",
        config = function()
            require('mason').setup({
                ensure_installed = {
                    "stylua",
                },
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                },
                auto_install = true
            })
        end
    },
}
