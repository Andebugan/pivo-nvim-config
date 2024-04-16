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
        -- csharp
        "c_sharp"
      },
      highlight = { enable = true },
      indent = { enable = true }
    })
  end
}
