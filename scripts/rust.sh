#!/bin/bash

function describe.rust() {
    echo -e "${YELLOW}rust${RESET} ${LIGHT_GRAY}- standard rust${RESET}"
}

function install.rust() {
    sudo curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
}
