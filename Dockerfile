FROM debian:bookworm
# docker build -t base-devenv --build-arg ssh_prv_key="$(cat ~/.ssh/id_rsa)" --build-arg ssh_pub_key="$(cat ~/.ssh/id_rsa.pub)" --squash .
# this image is for local development containers only, do not push it to public registies

ARG ssh_prv_key
ARG ssh_pub_key

RUN apt-get update\
  && apt-get upgrade -y\
  && apt-get install git wget openssh-server curl zip npm -y\
  && curl -L -O "https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz"\
  && tar -C /opt -xzf nvim-linux64.tar.gz\
  && echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.bashrc\
  && rm nvim-linux64.tar.gz\
  && apt-get autoremove -y

# ssh credentials

RUN mkdir -p /root/.ssh\
  && chmod 0700 /root/.ssh\
  && ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts\
  && echo "$ssh_prv_key" > /root/.ssh/id_rsa\
  && echo "$ssh_pub_key" > /root/.ssh/id_rsa.pub\
  && chmod 600 /root/.ssh/id_rsa\
  && chmod 600 /root/.ssh/id_rsa.pub

# setup neovim configuration
RUN mkdir ~/.config/\
  && git clone -b csharp git@github.com:Andebugan/pivo-nvim-config.git\
  && mv pivo-nvim-config ~/.config/nvim

# install C# dev tools
RUN wget https://packages.microsoft.com/config/debian/12/packages-microsoft-prod.deb -O packages-microsoft-prod.deb \
  && dpkg -i packages-microsoft-prod.deb\
  && rm packages-microsoft-prod.deb\
  && apt-get update && apt-get install dotnet-sdk-8.0 dotnet-runtime-8.0 -y\
  && apt autoremove -y
