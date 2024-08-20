#!/bin/bash

# install dependencies
apt-get update && apt-get upgrade -y

apt-get install git curl tar gcc npm -y

# install neovim
curl -L -O "https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"\
    && tar -C /opt -xzf nvim-linux64.tar.gz\
    && echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc\
    && rm nvim-linux64.tar.gz\
    && apt-get autoremove -y

# setup neovim configuration
mkdir ~/.config/\
    && cd ~\
    && git clone git@github.com:Andebugan/pivodev-nvim.git\
    && cp ~/pivodev-nvim/nvim/lua/plugins/config/config.lua ~/pivodev-nvim/nvim/lua/plugins/config/local_config.lua\
    && ln -s ~/pivodev-nvim/nvim/ ~/.config/nvim 
