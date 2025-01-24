#!/bin/bash

function describe.angular {
    echo -e "${YELLOW}angular${RESET} ${LIGHT_GRAY}- web + angular + angular lsp${RESET}"
}

function install.angular {
    sudo npm install -g @angular/cli
}
