#!/bin/bash

function describe.bash() {
    echo -e "${YELLOW}bash${RESET} ${LIGHT_GRAY}- sudo alias + fzf + bat + blesh${RESET}"
}

function install.bash() {
    # add custom bash command line
    echo 'export SHELL="/bin/bash"' >> ~/.bashrc\
        && echo 'export LS_OPTIONS="--color=auto"' >> ~/.bashrc\
        && echo 'alias ls="ls $LS_OPTIONS"' >> ~/.bashrc\
        && echo 'alias ll="ls $LS_OPTIONS -l"' >> ~/.bashrc\
        && echo 'alias l="ls $LS_OPTIONS -lA"' >> ~/.bashrc\
        && echo 'eval "$(dircolors)"' >> ~/.bashrc\
        && echo 'LS_COLORS=$LS_COLORS:"ow=1;35:" ; export LS_COLORS' >> ~/.bashrc\
        && echo PROMPT_COMMAND=\'PS1_CMD1='$(git branch --show-current 2>/dev/null)'\'\; PS1=\''\[\e[38;5;221;2m\]\u\[\e[0;90m\]@\[\e[38;5;209;2m\]\h\[\e[0;90m\]|\[\e[93m\]\w\[\e[90m\]|\[\e[1;32m\]${PS1_CMD1}\n\[\e[90m\]>\[\e[0m\] '\' >> ~/.bashrc

    # install fzf
    sudo apt install fzf

    # install bat (batcat)
    sudo apt install bat -y
    echo 'alias bat="batcat"' >> ~/.bashrc

    # install tldr
    sudo apt install npm
    npm install -g tldr

    # install blesh
    sudo apt install git make gawk -y
    git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git ~/.blesh
    old_dir=$PWD
    cd ~/.blesh
    make install PREFIX=~/.local
    cd "$old_dir"
    # remove competing completion package
    sudo apt remove bash-completion -y
    echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc

    # install vim as default editor
    sudo apt install vim -y
    echo 'EDITOR=vim' >> ~/.bashrc

    # add man pages
    sudo apt install man -y
    echo "" >> ~/.bashrc
    echo "export LESS_TERMCAP_mb=$'\e[01;31m'" >> ~/.bashrc       # begin blinking
    echo "export LESS_TERMCAP_md=$'\e[01;37m'" >> ~/.bashrc       # begin bold
    echo "export LESS_TERMCAP_me=$'\e[0m'" >> ~/.bashrc           # end all mode like so, us, mb, md, mr
    echo "export LESS_TERMCAP_se=$'\e[0m'" >> ~/.bashrc           # end standout-mode
    echo "export LESS_TERMCAP_so=$'\e[45;93m'" >> ~/.bashrc       # start standout mode
    echo "export LESS_TERMCAP_ue=$'\e[0m'" >> ~/.bashrc           # end underline
    echo "export LESS_TERMCAP_us=$'\e[4;93m'" >> ~/.bashrc        # start underlining

    # install so for stackoverflow/docs viewing
    sudo curl --proto '=https' --tlsv1.2 -sSf https://samtay.github.io/so/install.sh | bash -s -- --to /usr/bin

    echo 'Source bash config to apply changes: source ~/.bashrc'
}
