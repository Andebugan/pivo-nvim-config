#!/bin/bash

from="debian" # base (debian/alpine)
pivodev="yes" # pivodev-base/distro
extensions="" # python/csharp/ccpp... 
build="no" # build/only generate dockerfile
imgname="pivodev-base" # new image name 
run="no" # create container after image creation
run_args="-dit"
contname="pivodev" # new container name 

while getopts 'f:pe:bi:rc:ha:' opt; do
    case "$opt" in
        f)
            from="$OPTARG"
            ;;
        p)
            pivodev="no"
            ;;
        e)
            extensions=$extensions"$OPTARG;"
            ;;
        b)
            build="yes"
            ;;
        i)
            imgname="$OPTARG"
            ;;
        r)
            run="yes"
            ;;
        c)
            contname="$OPTARG"
            ;;
        a)
            run_args="$OPTARG"
            ;;
        ?|h)
            echo "Usage: $(basename $0) [-f {base image}] [-p] [-e {extension}] [-b] [-i {image name}] [-r] [-c {container name}] [-a \"{arguments}]"
            echo "-f {base image} - specify base distro (debian/alpine)"
            echo "-p - use pivodev-base image"
            echo "-e {extension} - add language or tool support to image"
            echo "-b - builds new image if used"
            echo "-i {image name} - specifies name of new image"
            echo "-r - use docker run after build"
            echo "-c {container name} - specify container name"
            echo "-a \"{arguments}\" - specify run arguments"
            exit 1
            ;;
    esac
done
shift "$(($OPTIND -1))"

touch Dockerfile

# add base
if [[ "$pivodev" == "yes" ]]; then
    cat docker/$from/base > Dockerfile 
else
    cat docker/$from/pivodev-base > Dockerfile 
fi

# add languages
if [[ "$extensions" == *"python"* ]]; then
    cat docker/$from/extensions/python >> Dockerfile
fi

if [[ "$extensions" == *"latex"* ]]; then
    cat docker/$from/extensions/latex >> Dockerfile
fi

if [[ "$extensions" == *"csharp"* ]]; then
    cat docker/$from/extensions/csharp >> Dockerfile
fi

# pull nvim config into db container
if [[ "$extensions" == *"postgres"* ]]; then
    cat docker/$from/extensions/postgres >> Dockerfile
fi

# add db tools for connection and work with external database
if [[ "$extensions" == *"dbtools"* ]]; then
    cat docker/$from/extensions/dbtools >> Dockerfile
fi

# build
build_command='docker build -t '$imgname' --build-arg ssh_prv_key="$(cat ~/.ssh/id_rsa)" --build-arg ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)" --build-arg git_user="$(git config user.name)" --build-arg git_mail="$(git config user.email)" --squash .'
if [[ "$build" == "no" ]]; then
    echo "Build command:"
    echo $build_command
    exit 1
fi

eval $build_command

# run
if [[ "$run" == "no" ]]; then
    exit 1
fi

run_command='docker run '$run_args' --name '$contname' '$imgname
eval $run_command
