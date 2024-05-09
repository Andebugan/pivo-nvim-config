return {
    {
        "williamboman/mason.nvim",
        config = function()
            local config = require("plugins.lang.config.config")

            -- default 
            local installed_packages = {
                "stylua"
            }

            -- check config add packages
            if config.ccpp then
                table.insert(installed_packages, "codelldb")
            end

            require('mason').setup({
                ensure_installed = installed_packages,
            })
        end
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            local config = require("plugins.lang.config.config")

            -- default 
            local installed_packages = {
                "lua_ls",
                "docker_compose_language_service",
                "dockerls",
                "jsonls",
                "lua_ls",
                "yamlls",
                "marksman"
            }

            -- check config add packages
            if config.ccpp then
                table.insert(installed_packages, "ast_grep")
            end
            if config.latex then
                table.insert(installed_packages, "texlab")
            end

            require("mason-lspconfig").setup({
                ensure_installed = installed_packages,
                auto_install = true
            })
        end
    },
}
