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
