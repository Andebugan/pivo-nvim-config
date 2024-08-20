# Pivodev - utility for building isolated docker-based development environments
![pivoscreen](https://github.com/Andebugan/pivodev/assets/40489252/9a6cec74-945b-4d7e-b849-a9c1a8a73c94)

While working with different language ecosystems I often come into installation, compatability and cleaning problems so I decided to create set of docker based configurations for automatic building of development environments IDE and special tools included. Basically [devcontainers](https://code.visualstudio.com/docs/devcontainers/containers) but IDE is inside them.

To achieve this all needed tools are installed inside container with [pivodev-nvim](https://github.com/Andebugan/pivodev-nvim/tree/master) or [pivodev-vim](https://github.com/Andebugan/pivodev-vim)

Functionality:
- Configurable Dockerfile builder and runner
- Flexible "swiss knife" Neovim configuration

Languanges/platforms in mind:
- [x] Python
- [x] LaTeX
- [x] C#
- [ ] C/C++
- [ ] Go
- [ ] Web development (http/css/js)
- [ ] Lua
- [ ] Markdown
- [ ] SQL
- [ ] Rust

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
