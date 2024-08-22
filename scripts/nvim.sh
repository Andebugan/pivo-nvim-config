#!/bin/bash

# install dependencies
sudo apt-get update && apt-get upgrade -y

sudo apt-get install git curl tar gcc npm -y

# install neovim
sudo curl -L -O "https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"\
    && sudo tar -C /opt -xzf nvim-linux64.tar.gz\
    && echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc\
    && sudo rm nvim-linux64.tar.gz\
    && sudo apt-get autoremove -y

# setup neovim configuration
mkdir -p ~/.config/\
    && cd ~\
    && git clone git@github.com:Andebugan/pivodev-nvim.git ~/.pivodev-nvim\
    && cp ~/.pivodev-nvim/nvim/lua/plugins/config/config.lua ~/.pivodev-nvim/nvim/lua/plugins/config/local_config.lua\
    && ln -s ~/.pivodev-nvim/nvim/ ~/.config/nvim 
