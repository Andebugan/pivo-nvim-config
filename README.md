# Pivodev - utility for building isolated docker-based development environments
```
╭───────────╮ ╭─╮      ╭─╮ ╭─────────╮  ╭──────────╮
│ ╭───────╮ │ │ │      │ │ │ ╭─────╮ │  │ ╭──────╮ │
│ │       │ │ │ │      │ │ │ │     │ │  │ │      │ │
│ │       │ │ │ │      │ │ │ ╰─────╯ ╰╮ │ │      │ │
│ │       │ │ │ │      │ │ │ ╭──────╮ │ │ │      │ │
│ │       │ │ │ │      │ │ │ │      │ │ │ │      │ │
│ │       │ │ │ ╰──────╯ │ │ ╰──────╯ │ │ ╰──────╯ │
╰─╯       ╰─╯ ╰──────────┘ ╰──────────╯ ╰──────────╯
```

While working with different development ecosystems I often come into installation, compatability and cleaning problems. So I decided to make set of docker based configurations for automatic building of development environments with IDE and special tools included. Basically [devcontainers](https://code.visualstudio.com/docs/devcontainers/containers) but you can develop inside them instead for connecting via ssh or other remote protocols

To achieve this all needed tools are installed inside container with [pivodev-nvim](https://github.com/Andebugan/pivodev-nvim/tree/master) or [pivodev-vim](https://github.com/Andebugan/pivodev-vim)

Functionality:
- Configurable Dockerfile builder and runner
- Flexible "get only what you need" Neovim configuration

Languanges/platforms in mind:
- [x] Python
- [x] LaTeX
- [x] C#
- [x] Markdown
- [ ] Jupyter
- [ ] C/C++
- [ ] Go
- [ ] Web development (http/css/js)
- [ ] Lua
- [ ] SQL
- [ ] Rust

## Installation

To install pivodev:
```
git clone https://github.com/Andebugan/pivodev ~/.pivodev
(cd ~/.pivodev && ./install.sh)
source ~/.bashrc
```

## Container builder
To use pivodev dockerfile builder you must execute install.sh script wich will simply add bin path and several bash variables into .bashrc (it can be done by hand if needed). Do not forget to source `.bashrc`. After that `pivodev` utility will be avaliable globally:
```
Usage: pivodev [-f {base image}] [-p] [-e {extension}] [-b] [-i {image name}] [-r] [-c {container name}] [-a "{arguments}]
-f {base image} - specify base distro (debian/alpine)
-p - use existing pivodev-base image
-e {extension} - add language or tool to image, supported extensions include:
  python, latex, csharp, postgres (pull nvim config into postgres container), dbtools (add nvim tools to work with existing container)
-b - builds new image immediatly
-i {image name} - specifies name (tag) of new image
-r - execute docker run after build
-c {container name} - specify container name
-a "{arguments}" - specify run arguments
```

## Language dependencies
Dependencies:
- Python:
    - pip - python package manager
    - python3 - python itself
    - debugpy - implementation of DAP for python
- LaTeX:
    - texlive
    - texlive-xetex
    - texlive-lang-cyrillic
    - ttf-mscorefont-installer
- C# (csharp):
    - dotnet-sdk-8.0
    - dotnet-runtime-8.0
