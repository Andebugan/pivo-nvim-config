#!/bin/bash

function describe.python() {
    echo -e "${YELLOW}python${RESET} ${LIGHT_GRAY}- pip + python + venv${RESET}"
}

function install.python() {
    sudo apt install pip python3-venv -y\
        && mkdir ~/.virtualenvs\
        && cd ~/.virtualenvs\
        && python3 -m venv debugpy\
        && debugpy/bin/python -m pip install debugpy
}
