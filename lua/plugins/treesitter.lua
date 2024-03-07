return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "javascript",
        "bash",
        "c",
        "cpp",
        "python",
        "c_sharp",
        "cmake",
        "css",
        "dockerfile",
        "diff",
        "html",
        "json",
        "latex",
        "sql",
        "vim",
        "vimdoc",
        "yaml",
        "markdown"
      },
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
