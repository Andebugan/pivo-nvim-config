#!/bin/bash

function describe.nvim() {
    echo -e "${YELLOW}nvim${RESET} ${LIGHT_GRAY}- nvim + pivodev-nvim${RESET}"
}

function install.nvim() {
    # install dependencies
    sudo apt-get update && apt-get upgrade -y

    sudo apt-get install git curl tar gcc npm unzip -y

    # install neovim
    sudo curl -L -o nvim.tar.gz "https://github.com/neovim/neovim/releases/download/v0.10.4/nvim-linux-x86_64.tar.gz"\
        && sudo mkdir /opt/nvim\
        && sudo tar -C /opt/nvim --strip-components 1 -xzf nvim.tar.gz\
        && echo 'export PATH="$PATH:/opt/nvim/bin"' >> ~/.bashrc\
        && sudo rm nvim.tar.gz\
        && sudo apt-get autoremove -y

    # setup neovim configuration
    mkdir -p ~/.config/\
        && cd ~\
        && git clone git@github.com:Andebugan/pivodev-nvim.git ~/.pivodev-nvim\
        && cp ~/.pivodev-nvim/nvim/lua/plugins/config/config.lua ~/.pivodev-nvim/nvim/lua/plugins/config/local_config.lua\
        && ln -s ~/.pivodev-nvim/nvim ~/.config/nvim 
}
