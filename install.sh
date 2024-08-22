#!/bin/bash

# sudo ignorer for executing bash commands
echo 'if [ $(id -u) -eq 0]; then' >> ~/.bashrc\
    && echo '   alias sudo=eval' >> ~/.bashrc\
    && echo 'fi' >> ~./bashrc

# temporary installer for pivodev
echo "export PIVODIR=~/.pivodev" >> ~/.bashrc
echo 'export PATH=$PATH:~/.pivodev/bin' >> ~/.bashrc
