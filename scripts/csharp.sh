#!/bin/bash

wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb\
    && sudo dpkg -i packages-microsoft-prod.deb\
    && sudo rm packages-microsoft-prod.deb\

    && sudo apt-get update\
    && sudo apt-get install dotnet-sdk-8.0 dotnet-runtime-8.0 aspnetcore-runtime-8.0 zip -y\
    && sudo apt autoremove -y
