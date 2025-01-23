#!/bin/bash

function process_install_help() {
    check_if_help "$@"
    if [[ "$?" -eq 0 ]] then
        return
    fi

    echo -e "${LIGHT_CYAN}Usage:${RESET} ${YELLOW}pivodev install [toolset_1] [toolset_2] [toolset_3]${RESET}
    ${WHITE}Avaliable toolsets (each toolset is defined in corresponding bash file at PIVODIR/scripts/):${RESET}"

    for toolset in $toolsets; do
        echo -e "       $(describe_toolset "$(get_toolset_name "$toolset")")"
    done

    exit 0
}

function process_install() {
    shift

    process_install_help "$@"

    selected_toolsets=()
   
    for var in "$@"; do
        selected_toolsets+="$var "
    done

    for toolset in $selected_toolsets; do
        install_toolset $toolset
    done

    echo -e "To apply changes: ${YELLOW}source ~/.bashrc${RESET}"
}
