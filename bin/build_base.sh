#!/bin/bash

function process_build_base_help()
{
    check_if_help "$@"
    if [[ "$?" -eq 0 ]] then
        return
    fi

    echo -e "${LIGHT_CYAN}Usage:${RESET} ${YELLOW}pivodev build base${RESET} - builds base image for pivodev containers"
    exit 0
}

function process_build_base()
{
    shift

    process_build_base_help "$@"

    cp $PIVODIR/docker/debian/Dockerfile $PWD/Dockerfile
    build_command='sudo docker build -t pivodev-base --build-arg ssh_prv_key="$(cat ~/.ssh/id_rsa)" --build-arg ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)" --build-arg git_user="$(git config user.name)" --build-arg git_mail="$(git config user.email)" --squash .'
    eval $build_command
    rm $PWD/Dockerfile
}
