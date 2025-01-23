# BASE
FROM debian:bookworm
RUN echo '<!> THIS IMAGE IS FOR LOCAL DEVELOPMENT CONTAINERS ONLY, DO NOT PUSH IT TO PUBLIC REGISTRIES <!>'

# update packages
RUN apt-get update\
    && apt-get upgrade -y

# install packages
RUN apt-get install git wget openssh-server curl tar ripgrep fd-find npm apt-utils -y

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

# install locales
RUN apt-get install -y locales locales-all -y
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# git setup
ARG git_user
ARG git_mail

RUN git config --global user.email "${git_mail}"\
    && git config --global user.name "${git_user}"\
    && git config --global pull.rebase false 

# dummy sudo for security reasons
RUN echo '#!/bin/bash' > /usr/bin/sudo\
    && echo '$@' > /usr/bin/sudo\
    && chmod +x /usr/bin/sudo

# manually set user variable
ENV USER="root"

SHELL ["/bin/bash", "-c"]
