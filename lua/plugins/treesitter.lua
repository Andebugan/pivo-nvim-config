return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")
    config.setup({
      ensure_installed = {
        "lua",
        "bash",
        "dockerfile",
        "diff",
        "json",
        "vim",
        "vimdoc",
        "yaml",
        "markdown",
        -- C/C++
        "c",
        "cpp",
        "cmake",
      },
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
