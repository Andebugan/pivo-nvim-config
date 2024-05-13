# BASE
FROM debian:bookworm
# docker build -t pivodev-base --build-arg ssh_prv_key="$(cat ~/.ssh/id_rsa)" --build-arg ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)" --build-arg git_user="$(git config user.name)" --build-arg git_mail="$(git config user.email)" --squash .
# <!> THIS IMAGE IS FOR LOCAL DEVELOPMENT CONTAINERS ONLY, DO NOT PUSH IT TO PUBLIC REGISTIES <!>
# ssh arguments

# update packages
RUN apt-get update\
    && apt-get upgrade -y\
    && apt-get install git wget openssh-server curl tar ripgrep npm -y

# install neovim
RUN curl -L -O "https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"\
    && tar -C /opt -xzf nvim-linux64.tar.gz\
    && echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc\
    && rm nvim-linux64.tar.gz\
    && apt-get autoremove -y

# ssh credentials
ARG ssh_prv_key
ARG ssh_pub_key

RUN mkdir -p /root/.ssh\
    && chmod 0700 /root/.ssh\
    && ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts\
    && echo "$ssh_prv_key" > /root/.ssh/id_rsa\
    && echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub\
    && chmod 600 /root/.ssh/id_rsa\
    && chmod 600 /root/.ssh/id_rsa.pub

# git setup
ARG git_user
ARG git_mail

RUN git config --global user.email "${git_mail}"\
    && git config --global user.name "${git_user}"

# setup neovim configuration
RUN mkdir ~/.config/\
    && cd ~\
    && git clone -b develop git@github.com:Andebugan/pivodev.git\
    && cp -r ~/pivodev/nvim ~/.config/

# add custom bash command line
RUN echo 'export SHELL="/bin/bash"' >> ~/.bashrc\
    && echo 'export LS_OPTIONS="--color=auto"' >> ~/.bashrc\
    && echo 'alias ls="ls $LS_OPTIONS"' >> ~/.bashrc\
    && echo 'alias ll="ls $LS_OPTIONS -l"' >> ~/.bashrc\
    && echo 'alias l="ls $LS_OPTIONS -lA"' >> ~/.bashrc\
    && echo 'eval "$(dircolors)"' >> ~/.bashrc\
    && echo 'PROMPT_COMMAND="PS1_CMD1=$(git branch --show-current 2>/dev/null)"; PS1="\[\e[38;5;221;2m\]\u\[\e[0;90m\]@\[\e[38;5;209;2m\]\h\[\e[0;90m\]|\[\e[93m\]\w\[\e[90m\]|\[\e[1;32m\]${PS1_CMD1}\n\[\e[90m\]>\[\e[0m\] "' >> ~/.bashrc

RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# FLAVOURS
# could be added as additional installs to new pivodev image, or as new image, based on pivodev-base

# C/C++
# TODO

# Python
# RUN apt install pip python3-venv -y\
#   && mkdir /root/.virtualenvs\
#   && cd /root/.virtualenvs\
#   && python3 -m venv debugpy\
#   && debugpy/bin/python -m pip install debugpy\
#   && sed -i -e 's/python = false/python = true/g' /root/.config/nvim/lua/plugins/config/config.lua

# C#
#RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
#  && dpkg -i packages-microsoft-prod.deb\
#  && rm packages-microsoft-prod.deb\
#  && apt-get install dotnet-sdk-8.0 dotnet-runtime-8.0 -y\
#  && apt autoremove -y

# js/css/html
# TODO

# PostgreSQL
# TODO

# MySQL
# TODO

# LaTeX
#RUN apt-get install texlive texlive-xetex texlive-lang-cyrillic ttf-mscorefonts-installer -y\
# && apt autoremove -y

# TODO
# move all changable parts to variables (rood dir path and etc)
