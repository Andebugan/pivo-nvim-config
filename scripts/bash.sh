#!/bin/bash

apt-get install git wget openssh-server curl tar ripgrep fd-find -y

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
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf\
    && ~/.fzf/install --all

source ~/.bashrc
