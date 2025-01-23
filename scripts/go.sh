#!/bin/bash

function describe.go() {
    echo -e "${YELLOW}go${RESET} ${LIGHT_GRAY}- standard go${RESET}"
}

function install.go() {
    wget https://go.dev/dl/go1.22.5.linux-amd64.tar.gz\
        && sudo rm -rf /usr/local/go && tar -C /usr/local -xzf go1.22.5.linux-amd64.tar.gz\
        && sudo rm go1.22.5.linux-amd64.tar.gz\
        && echo export PATH=$PATH:/usr/local/go/bin >> ~/.bashrc
}
