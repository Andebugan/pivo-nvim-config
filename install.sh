#!/bin/bash

has_pivodir=$(cat ~/.bashrc | grep -c "export PIVODIR=~/.pivodev")

if [ $has_pivodir -eq 0 ]; then
    echo '' >> ~/.bashrc
    echo 'export PIVODIR=~/.pivodev' >> ~/.bashrc
    echo 'export PATH=$PATH:~/.pivodev/bin' >> ~/.bashrc
fi
