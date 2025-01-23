#!/bin/bash

function describe.latex() {
    echo -e "${YELLOW}latex${RESET} ${LIGHT_GRAY}- texlive + ttf cyrillic lang + dependencies${RESET}"
}

function install.latex() {
    sudo apt-get install texlive texlive-xetex texlive-lang-cyrillic ttf-mscorefonts-installer -y\
        && sudo apt autoremove -y
}
