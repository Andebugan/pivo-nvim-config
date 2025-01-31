#!/bin/bash

toolsets=()

for filename in $(dirname $0)/../scripts/*.sh; do
    source $filename
    toolsets+="$filename "
done

function get_toolset_name() {
    echo $(basename "${1%.*}")
}

function validate_toolset() {
    for toolset in $toolsets; do
        name=$(get_toolset_name "$toolset")
        if [[ "$name" = "$1" ]] then
            return 0
        fi
    done

    echo -e "${RED}Unable to find ${RESET}$1${RED} in avaliable toolsets!${RESET}"
}

function describe_toolset() {
    for toolset in $toolsets; do
        name=$(get_toolset_name "$toolset")
        if [[ "$name" = "$1" ]] then
            echo $("describe.$name")
            return 0
        fi
    done

    echo -e "${RED}Unable to find ${RESET}$1${RED} in avaliable toolsets!${RESET}"
}

function install_toolset() {
    for toolset in $toolsets; do
        name=$(get_toolset_name "$toolset")
        if [[ "$name" = "$1" ]] then
            ("install.$name")
            return 0
        fi
    done

    echo -e "${RED}Unable to find ${RESET}$1${RED} in avaliable toolsets!${RESET}"
    return -1
}
