#!/bin/bash

source $(dirname $0)/build_base.sh
source $(dirname $0)/build_dev.sh

function process_build_help() {
    check_if_help "$@"
    if [[ "$?" -eq 0 ]] then
        return
    fi

    echo -e "\
${LIGHT_CYAN}Usage:${RESET} ${YELLOW}pivodev build base${RESET} - builds base image for pivodev containers
    ${WHITE}pivodev build base${RESET} - ${LIGHT_GRAY}create base pivodev container${RESET}
    ${WHITE}pivodev build dev${RESET} - ${LIGHT_GRAY}create pivodev container${RESET}"

    exit 0
}

function process_build() {
    shift 

    process_build_help "$@"

    if [[ "$1" == "base" ]]; then
        process_build_base "$@"
    elif [[ "$1" == "dev" ]]; then
        process_build_dev "$@"
    fi
}
