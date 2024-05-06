# Pivodev - configuration for isolated docker-based developer environments

When working on projects often I come into compatability and installation problems. As a result I decided to create set of docker based configuration files for automatic creating of development environments.

Basic functionality will include:
- [ ] Neovim base configuration and templates for creating IDE specific to development requirements
- [ ] Set of dockerfiles for specific projecs

Languanges/platforms in mind:
- [ ] C#
- [ ] C/C++
- [ ] Go
- [ ] Web (http/css/js)
- [ ] LaTeX
- [ ] Lua
- [ ] Markdown
- [ ] SQL
- [ ] Python
- [ ] Rust

TODO:
- [ ] development
    - [ ] code writing
        - [ ] sytax highlight/analysis
        - [ ] code completions
        - [ ] code suggestions
    - [ ] git integration
        - [ ] changed highlight
        - [ ] merge diff support
    - [ ] documentation
        - [ ] docs fetcher/builder
    - [ ] project management
        - [ ] bookmark support
    - [ ] docker integration
    - [ ] Markdown/LaTeX
        - [ ] preview (live, if possible)
- [ ] navigation
    - [ ] file navigator
    - [ ] cached file/dir search
- [ ] utility
    - [ ] pivo screen
    - [x] bash config
        - [x] git info

## Global configuration

Package dependencies:
- openssh-server - for ssh credentials management (pulling your repos from github/gitlab/etc.)

## Neovim 

Base installation dependencies:
- git - for pulling repo and git-based repos 
- curl - downloading newest version of neovim (sadly apt-based package managers do not provide latest versions of neovim)

Package manager - [*lazy.nvim*](https://github.com/folke/lazy.nvim), as most stable and maintained (packer.nvim unmaintained since august 2023)

gcc and make for telescope plugin (fzf native)
