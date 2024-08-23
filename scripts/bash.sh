#!/bin/bash

sudo apt-get install git wget openssh-server curl tar ripgrep fd-find -y

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

# install blesh
sudo apt install git make gawk -y
git clone --recursive --depth 1 --shallow-submodules https://github.com/akinomyoga/ble.sh.git ~/.blesh
(cd ~/.blesh && make install PREFIX=~/.local -y)
# remove competing completion package
sudo apt remove bash-completion -y
echo 'source ~/.local/share/blesh/ble.sh' >> ~/.bashrc

echo 'Source bash config to apply changes: source ~/.bashrc'
