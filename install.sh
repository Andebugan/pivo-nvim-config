#!/bin/bash

# temporary installer for pivodev

echo "export PIVODEV_DOCKER_DIR=$PWD/docker" >> ~/.bashrc
echo 'export PATH=$PATH:'$PWD'/bin' >> ~/.bashrc
