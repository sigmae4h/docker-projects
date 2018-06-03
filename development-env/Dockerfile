FROM ubuntu:latest

# Install core tools
RUN apt-get update && apt-get install -y \
        ctags \
        curl \
        git \
        jq \
        software-properties-common \
        tmux \
        vim \
        wget \
    && rm -rf /var/lib/apt/lists/*

# Install Java 8 JDK
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
    add-apt-repository ppa:webupd8team/java && \
    apt-get update && apt-get install -y \
        oracle-java8-installer \
    && rm -rf /var/lib/apt/lists/*

# Install nodejs 8
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && \
    apt-get update && apt-get install -y \
        nodejs \
    && rm -rf /var/lib/apt/lists/* && \
    npm install -g @angular/cli

# Create user `developer`. Replace 1000 with your user / group id
RUN export uid=1000 gid=1000 && \
    mkdir -p /home/developer && \
    echo "developer:x:${uid}:${gid}:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:${uid}:" >> /etc/group && \
    chown ${uid}:${gid} -R /home/developer

WORKDIR /home/developer
USER developer

ENV HOME /home/developer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
