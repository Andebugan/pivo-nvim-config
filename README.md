# Pivodev - configuration for isolated docker-based developer environments
![pivoscreen](https://github.com/Andebugan/pivodev/assets/40489252/9a6cec74-945b-4d7e-b849-a9c1a8a73c94)

When working on projects often I come into compatability and installation problems. As a result I decided to create set of docker based configuration files for automatic creating of development environments.

Basic functionality will include:
- [ ] Neovim base configuration and templates for creating IDE specific to development requirements
- [ ] Set of dockerfiles for specific projecs

Languanges/platforms in mind:
- [ ] C#
- [ ] C/C++
- [ ] Go
- [ ] Web (http/css/js)
- [x] LaTeX
- [ ] Lua
- [ ] Markdown
- [ ] SQL
- [~] Python
- [ ] Rust

TODO:
- [ ] development
    - [ ] code writing
        - [x] sytax highlight/analysis (nvim-treesitter)
        - [x] code completions (luasnip, nvim-cmp)
        - [x] code suggestions (mason, lspconfig)
    - [x] git integration (gitsigns, vim-fugitive)
    - [ ] documentation
    - [x] project management (telescope projects)
    - [x] docker integration
    - [ ] Markdown/LaTeX preview (live, if possible)
- [x] navigation
    - [x] file navigator (oil)
    - [x] file/dir search (telescope)
- [x] utility
    - [x] pivo screen
    - [x] custom bash line config
        - [x] git info

## Global configuration

Package dependencies:
- openssh-server - for ssh credentials management (pulling your repos from github/gitlab/etc.)

## Neovim 

Base installation dependencies:
- git - for pulling repo and git-based repos 
- curl - downloading newest version of neovim (sadly apt-based package managers do not provide latest versions of neovim)

Package manager - [*lazy.nvim*](https://github.com/folke/lazy.nvim), as most stable and maintained (packer.nvim unmaintained since august 2023)

### Packages

Base neovim installation:
+ filesystem navigation:
  + telescope.nvim - pickers, sorters and previewers, [github](https://github.com/nvim-telescope/telescope.nvim)
    + plenary.nvim - dependency of telescope, [github](https://github.com/nvim-lua/plenary.nvim)
    + telescope-project.nvim - project management with telescope, [github](https://github.com/nvim-telescope/telescope-project.nvim)
    + telescope-ui-select.nvim - sets vim.ui.select to telescope, [github](https://github.com/nvim-telescope/telescope-ui-select.nvim)
  + oil.nvim - allows to manage files via neovim buffer, [github](https://github.com/stevearc/oil.nvim) (neotree exists as viable alternative but personaly I find oil more "natura" to use)
+ syntax:
  + nvim-treesitter - general syntax parser, [github](https://github.com/nvim-treesitter/nvim-treesitter)
+ completion and snippets:
  + LuaSnip.nvim - snippet engine for neovim, [github](https://github.com/L3MON4D3/LuaSnip)
  + nvim-cmp - neovim completion plugin, written in lua, [github](https://github.com/hrsh7th/nvim-cmp)
+ git:
  + vim-fugitive - git integration, [github](https://github.com/tpope/vim-fugitive)
  + gitsigns.nvim - git decorations, [github](https://github.com/lewis6991/gitsigns.nvim)
+ misc code tools:
  + vim-commentary - comment actions, [github](https://github.com/tpope/vim-commentary)
  + vim-surround - parentness manager, [github](https://github.com/tpope/vim-surround)
+ appearance:
  + alpha-nvim - neovim greeter, [github](https://github.com/goolord/alpha-nvim)
  + lualine.nvim - custom neovim status line, [github](https://github.com/nvim-lualine/lualine.nvim)
  + kaganawa.nvim - personal colorscheme choice, [github](https://github.com/rebelot/kanagawa.nvim)

lsp, debugging and formatting, based on lspconfig and mason because (coc is good too tho but native is my personal choice):
+ nvim-lspconfig - collection of configuration for Nvim's LSP client, [github](https://github.com/neovim/nvim-lspconfig)
+ mason-lspconfig.nvim - bridge lspconfig and mason, [github](https://github.com/williamboman/mason-lspconfig.nvim)
+ mason.nvim - external tool manager (LSP servers, etc.), [github](https://github.com/williamboman/mason.nvim?tab=readme-ov-file)
+ nvim-dap - debug adapter protocol (debugging support), [github](https://github.com/mfussenegger/nvim-dap), [adapter configuraions](https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#python)
+ nvim-dap-ui - debugger ui, [github](https://github.com/rcarriga/nvim-dap-ui)

## Languages
To install language and it's tools uncomment required section in dockerfile.

Dependencies:
- Python:
  - pip - python package manager
  - python3 - python itself
  - debugpy - implementation of DAP for python
