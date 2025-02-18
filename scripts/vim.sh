#!/bin/bash

function describe.vim() {
    echo -e "${YELLOW}vim${RESET} ${LIGHT_GRAY}- vim + pivodev-vim${RESET}"
}

function install.vim() {
    # install dependencies
    sudo apt-get update && apt-get upgrade -y

    sudo apt-get install git -y

    # install vim
    sudo apt install vim -y\
        && sudo apt-get autoremove -y

    # setup vim configuration
    cd ~\
        && git clone git@github.com:Andebugan/pivodev-vim.git ~/.pivodev-vim\
        && ln -s ~/.pivodev-vim/.vimrc ~/.vimrc
}
