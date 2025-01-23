#!/bin/bash

install_option="-I"
build_option="-b"
image_option="-i"
run_option="-r"
run_args_option="-a"
contname_option="-c"
clean_files_option="-C"

function process_build_dev_help()
{
    check_if_help "$@"
    if [[ "$?" -eq 0 ]] then
        return
    fi

    echo -e "\
${LIGHT_CYAN}Usage:${RESET} ${YELLOW}pivodev build dev [options]${RESET}
    ${LIGHT_GRAY}Options:${RESET}
        ${WHITE}$build_option ${LIGHT_GRAY}- build image based on generated Dockerfile${RESET}    
        ${WHITE}$image_option {image name} ${LIGHT_GRAY}- define custom image name (pivodev-base by default)${RESET}
        ${WHITE}$run_option ${LIGHT_GRAY}- create and run container after image creation${RESET}
        ${WHITE}$contname_option {container name} ${LIGHT_GRAY}- provide container name (pivodev by default)${RESET}
        ${WHITE}$run_args_option \"{docker run aruments}\" ${LIGHT_GRAY}- provide docker run arguments (-dit --network=host by default)${RESET}
        ${WHITE}$clean_files_option ${LIGHT_GRAY}- clean generated files after container creation${RESET}
        ${WHITE}$install_option {toolset} ${LIGHT_GRAY}- install predefined toolsets into container${RESET}:"
    for toolset in $toolsets; do
        echo -e "          $(describe_toolset "$(get_toolset_name "$toolset")")"
    done

    exit 0
}

function process_build_dev()
{
    shift

    process_build_dev_help "$@"

    install="" # install tools via pivodev
    build=false # build/only generate dockerfile
    imgname="pivodev-img" # new image name 
    run=false # create container after image creation
    run_args="-dit --network=host"
    contname="pivodev" # new container name 
    clean_files=false  # remove generated files after execution

    # parse options
    while [ $# -gt 0 ]
    do
        if [[ "$1" == "$build_option" ]]; then
            build=true
        elif [[ "$1" == "$install_option" ]]; then
            shift
            validate_toolset "$1"
            install="$1 $install"
        elif [[ "$1" == "$image_option" ]]; then 
            shift
            imgname="$1"
        elif [[ "$1" == "$run_option" ]]; then
            run=true
        elif [[ "$1" == "$run_args_option" ]]; then
            shift
            run_args="$1"
        elif [[ "$1" == "$contname_option" ]]; then
            shift
            contname_option="$1"
        elif [[ "$1" == "$clean_files_option" ]]; then
            clean_files=true
        else
            echo -e "${LIGHT_RED}Unable to parse${RESET} $1${LIGHT_RED}!"
            exit 0
        fi
        shift
    done

    # create dockerfile
    touch "$PWD/Dockerfile"
    echo "FROM pivodev-base:latest" >> $PWD/Dockerfile
    echo "RUN echo '<!> THIS IMAGE IS FOR LOCAL DEVELOPMENT CONTAINERS ONLY, DO NOT PUSH IT TO PUBLIC REGISTRIES <!>'" >> $PWD/Dockerfile

    echo -e "\
# install pivodev
RUN git clone git@github.com:Andebugan/pivodev.git ~/.pivodev\
    && cd ~/.pivodev\
    && ./install.sh\
    && cd ~

# manually set pivodev environment variables
ENV PIVODIR="~/.pivodev"
ENV PATH="$PATH:~/.pivodev/bin"
" >> $PWD/Dockerfile

    for toolset in $install; do
        echo "RUN pivodev install $toolset" >> $PWD/Dockerfile
    done

    # build
    build_command='sudo docker build -t '$imgname' --squash .'

    if [[ "$build" == false ]]; then
        echo $build_command
    else
        # build image
        eval $build_command
    fi

    # run
    if [[ "$run" == true ]] && [[ "$build" == true ]]; then
        # run container
        run_command='sudo docker run '$run_args' --name '$contname' '$imgname
        eval $run_command
    fi

    # clean files
    if [[ "$clean_files" == true ]]; then
        rm "$PWD/Dockerfile"
    fi
}
