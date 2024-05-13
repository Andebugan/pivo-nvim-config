#!/bin/bash

depends="no" # pivodev-base? 
langs="" # python/csharp/ccpp... 
build="no" # build/only generate dockerfile
imgname="pivodev-base" # new image name 
run="no" # create container after image creation
run_args="-dit"
contname="pivodev" # new container name 

while getopts 'dl:bi:rc:ha:' opt; do
    case "$opt" in
        d)
            depends="yes"
            ;;
        l)
            langs=$langs"$OPTARG;"
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
            echo "Usage: $(basename $0) [-p] [-l {language}] [-b] [-i {image name}] [-r] [-c {container name}] [-a {arguments}]"
            echo "-d - if used builds new image based on pivodev-base"
            echo "-l {language} - add language support to image"
            echo "-b - builds new image if used"
            echo "-i {image name} - specifies name of new image"
            echo "-r - if used new contained is created"
            echo "-c {container name} - specify container name"
            echo "-a {arguments} - specify run arguments"
            exit 1
            ;;
    esac
done
shift "$(($OPTIND -1))"

touch Dockerfile

# add base
if [ "$depends" == "yes" ]; then
    cat docker/pivobase > Dockerfile 
else  
    cat docker/base > Dockerfile 
fi

# add languages
if [[ "$langs" == *"python"* ]]; then
    cat docker/langs/python >> Dockerfile
fi

if [[ "$langs" == *"latex"* ]]; then
    cat docker/langs/latex >> Dockerfile
fi

if [[ "$langs" == *"csharp"* ]]; then
    cat docker/langs/csharp >> Dockerfile
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
