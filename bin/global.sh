#!/bin/bash

function check_if_help() {
    if [[ "$1" == "-h" ]] || [[ "$1" == "?" ]] || [[ "$1" == "--help" ]]; then
        return 1
    else
        return 0
    fi
}

function process_command_help() {
    check_if_help "$1"

    if [[ "$?" -eq 0 ]] then
        return
    fi

    echo -e "\
${LIGHT_CYAN}Usage:${RESET} ${YELLOW}pivodev {install|build} [options] ${RESET}
    ${WHITE}pivodev install${RESET} - ${LIGHT_GRAY}install toolsets for specific languages/frameworks${RESET}
    ${WHITE}pivodev build${RESET} - ${LIGHT_GRAY}build docker image and/or run container with pivodev and git ssh keys preinstalled${RESET}"

    exit 0
}

