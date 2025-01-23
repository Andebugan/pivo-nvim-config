#!/bin/bash

function print_command_help() {
    if [[ "$1" == "-h" ]] || [[ "$1" == "?" ]] || [[ "$1" == "--help" ]]; then
        echo -e "\
${LIGHT_CYAN}Usage:${RESET} ${YELLOW}pivodev {install|build} [options] ${RESET}
    ${WHITE}pivodev install${RESET} - ${LIGHT_GRAY}install toolsets for specific languages/frameworks${RESET}
    ${WHITE}pivodev build${RESET} - ${LIGHT_GRAY}build docker image and/or run container with pivodev and git ssh keys preinstalled${RESET}"
        exit 0
    else
        return 0
    fi
}
